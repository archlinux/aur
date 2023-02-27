# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-test
_pkgname=TangoTest
pkgver=3.6
pkgrel=1
groups=('tango-controls')
pkgdesc="A famous TANGO server developed for testing."
arch=('x86_64')
url="https://www.tango-controls.org/"
license=('GPL3')
depends=('tango-cpp')
makedepends=('cmake')
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
  "cmake_version.patch"
)
sha256sums=(
  '6bbaab43eed6c3d775931721b1fe84a70cd3d21661069ef767c25ac7f378f812'
  '078ec4aeeadf94eea13f5950de4b9475ee82518bf3241fc0ee6063e3d07943da'  
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
