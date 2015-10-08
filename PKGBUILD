#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="An open-source library for mathematical programming"
url="http://ampl.github.io"
pkgname=ampl-mp
pkgver=2.0.3
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake')
depends=()
optdepends=()
_dir="mp-${pkgver}"
source=("https://github.com/ampl/mp/archive/${pkgver}.tar.gz")
sha256sums=("4ae38da883cfdf077d57c488b03756d9068b1d5b8552db983f6690246edc71a8")

_modules=""

prepare() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  cmake "${srcdir}/${_dir}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD=${_modules}
}

build() {
  cd "${srcdir}/build"
  make
}

check() {
  cd "${srcdir}/build"
  make test
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
