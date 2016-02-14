# Maintainer: gileri <twiked at gmail d(0)t com>
pkgname=pyosmium-git
pkgver=v2.6.0.r2.gc7604fd
pkgrel=1
pkgdesc="Python bindings for libosmium"
url="http://osmcode.org/pyosmium"
arch=('x86_64' 'i686')
license=('custom')
depends=('boost-libs' 'libosmium')
optdepends=()
conflicts=('pyosmium')
provides=('pyosmium')
source=('pyosmium::git+https://github.com/osmcode/pyosmium.git')
md5sums=('SKIP')

pkgver() {
  cd pyosmium
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/pyosmium"
  python setup.py build
}

package() {
  cd "${srcdir}/pyosmium"
  python setup.py install --prefix="${pkgdir}/usr/"
  ls
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
