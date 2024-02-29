# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-test
_pkgname=TangoTest
pkgver=3.9
pkgrel=1
groups=(tango-controls)
pkgdesc="A famous TANGO server developed for testing."
arch=(x86_64)
url="https://gitlab.com/tango-controls/${_pkgname}"
license=(GPL3)
depends=(tango-cpp)
makedepends=(cmake)
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/releases/${pkgver}/downloads/${_pkgname}-with-submodules-${pkgver}.tar.gz"
  "cmake_version.patch"
)
sha256sums=(
  "71e5f6273212053748901ed1c7174db394e15a18301aef7de68d54f90cc979b9"
  "af54571ed8374c85899b219680fdfa7547b7d9ea3cc0cbf17fefe9212a629628"
)

prepare() {
  cd ${_pkgname}-with-submodules-${pkgver}
  patch -N -p1 --input="${srcdir}/cmake_version.patch"
}

build() {
  cmake -B bld -S "${_pkgname}-with-submodules-${pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build bld
}

package() {
  DESTDIR="${pkgdir}" cmake --install bld
}
