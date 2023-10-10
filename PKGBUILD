# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-test
_pkgname=TangoTest
pkgver=3.8
pkgrel=1
groups=('tango-controls')
pkgdesc="A famous TANGO server developed for testing."
arch=('x86_64')
url="https://gitlab.com/tango-controls/${_pkgname}"
license=('GPL3')
depends=('tango-cpp')
makedepends=('cmake')
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
  "cmake_version.patch"
)
sha256sums=(
  '4111fe1499def4746b9d6d1830f2fbc9a21b785f80ba0b957795077fb68d02d1'
  'af54571ed8374c85899b219680fdfa7547b7d9ea3cc0cbf17fefe9212a629628'
)

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -N -p1 --input="${srcdir}/cmake_version.patch"
}

build() {
  cmake -B bld -S "${_pkgname}-${pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build bld
}

package() {
  DESTDIR="${pkgdir}" cmake --install bld
}
