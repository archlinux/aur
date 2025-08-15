# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-test
_pkgname=TangoTest
pkgver=3.11
pkgrel=2
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
  "793d5340a5fe0f9954296eff96afe0a15191d1c1a3895ba3c535cf26984f1677"
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
