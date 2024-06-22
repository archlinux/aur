# Contributor: Martin Kaffanke <martin@kaffanke.at>

pkgname=b2fuse-git
pkgver=1.3.r62.g1c5bfa9
pkgrel=1
pkgdesc="FUSE integration for Backblaze B2 Cloud storage"
arch=('any')
url="https://github.com/falense/b2_fuse"
license=('MIT')
depends=('python-fusepy' 'python-b2sdk' 'python-pyaml')
makedepends=('git')
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
