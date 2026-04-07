# Maintainer: Wolfgang Popp <mail@wolfgang-popp.de>

pkgname=studip-sync-git
pkgver=r202.b50552d
pkgrel=1
pkgdesc="Sync your files from Stud.IP"
arch=('any')
url="https://github.com/studip-sync/studip-sync"
license=('UNLICENSE')
depends=('rsync' 'python-requests' 'python-beautifulsoup4' 'python-lxml')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname::git+https://github.com/studip-sync/studip-sync.git")
md5sums=('SKIP')

pkgver(){
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
