# Maintainer: redtide <redtid3@gmail.com>

pkgname=magnifiqus
pkgver=0.2.0
pkgrel=1
pkgdesc="Qt based screen magnifier"
arch=('x86_64')
url="https://github.com/redtide/${pkgname}"
license=('GPL2')
depends=('qt5-base' 'qt5-x11extras')
makedepends=('cmake' 'qt5-tools')
provides=('magnifiqus')
conflicts=('magnifiqus')
source=("https://github.com/redtide/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ddf3101cfc4979951a3081f484f5629e3624b9317c80863e57f194b8c91a2a4482d7de14c56cfb4e0f375bf0181be749695b4bf4df5f5bc428ffa059bfef6249')
b2sums=('c53db2795bd58385ed436f3e2fc9195aff2990e446324cebcf548b173c53536c49b01d8ba862d783400bd9c3054dc48561265fcc17672b330deeda4d7713810d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Wno-dev \
        -B build \
        -S .
  cmake --build build --target all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
