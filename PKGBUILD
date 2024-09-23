# Maintainer: gileri <twiked at gmail d(0)t com>
pkgname=pyosmium-git
pkgver=4.0.0.r0.g3091925
pkgrel=1
pkgdesc="Python bindings for libosmium"
url="http://osmcode.org/pyosmium"
arch=('x86_64' 'i686')
license=('custom')
depends=('boost' 'libosmium' 'python' 'protozero')
makedepends=('git' 'pybind11' 'python-setuptools' 'cmake' 'boost-libs')
optdepends=()
conflicts=('pyosmium')
provides=('pyosmium')
source=('pyosmium::git+https://github.com/osmcode/pyosmium.git')
md5sums=('SKIP')

pkgver() {
  cd pyosmium
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/pyosmium"
  python setup.py build
}

package() {
  cd "${srcdir}/pyosmium"
  python setup.py install --prefix="/usr/" --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
