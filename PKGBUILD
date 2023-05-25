# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-test
_pkgname=TangoTest
pkgver=3.7
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
  '4c3eabf9922ffcfd3aa2f4962881f9d4c6d6164345163d0e3c6169cd8894a6d0'
  'd614869c15e1b433d0118632d71030162acb6bf7d3ea1b0cef29a3c588edaf35'
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
