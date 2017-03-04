# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ampl-mp
pkgver=3.1.0
pkgrel=2
pkgdesc="An open-source library for mathematical programming"
arch=('i686' 'x86_64')
url="http://ampl.github.io"
license=('custom')
makedepends=('cmake')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ampl/mp/archive/${pkgver}.tar.gz")
sha256sums=('587c1a88f4c8f57bef95b58a8586956145417c8039f59b1758365ccc5a309ae9')

_modules=""

build() {
  mkdir -p build
  cd build

  cmake ../mp-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD=${_modules}
  make
}

check() {
  cd build

  make test
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  mv "${pkgdir}"/usr/share/mp/LICENSE.rst \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
