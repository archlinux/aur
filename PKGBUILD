# Maintainer: redtide <redtid3@gmail.com>

_pkgname=magnifiqus
pkgname="${_pkgname}-git"
pkgver=r1.ec3c95d
pkgrel=1
pkgdesc="Qt based screen magnifier"
url="https://github.com/redtide/${_pkgname}"
arch=("x86_64")
license=("GPL2")
depends=('qt5-base' 'qt5-x11extras')
makedepends=('cmake' 'git' 'qt5-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"::"git+${url}")
sha512sums=('SKIP')

pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Wno-dev \
        -B build \
        -S .
  cmake --build build --target all
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
