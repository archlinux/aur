# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=dwipe-git
_pkgname=dwipe
pkgver=r12.8953a1c
pkgrel=1
pkgdesc="wipe disks and partitions"
arch=('any')
url="https://github.com/joedefen/dwipe"
license=('MIT')
depends=('python')
makedepends=('git' 'python-wheel' 'python-build' 'python-installer')
source=("dwipe::git+https://github.com/joedefen/dwipe.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
python -m build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl
}

