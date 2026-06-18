# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-test
_pkgname=TangoTest
pkgver=3.14
pkgrel=1
groups=(tango-controls)
pkgdesc="A famous TANGO server developed for testing."
arch=("x86_64" "armv7h")
url="https://gitlab.com/tango-controls/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("glibc" "gcc-libs" "omniorb" "tango-cpp")
makedepends=(cmake)
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/releases/${pkgver}/downloads/${_pkgname}-with-submodules-${pkgver}.tar.gz"
  "cmake_version.patch"
)
sha256sums=(
  "13e58acd0800a44d7b3dbf14acae914f84b9d71bbaf07723671776115d756f40"
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
