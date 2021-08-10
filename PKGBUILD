# Maintainer: redtide <redtid3@gmail.com>

pkgname=magnifiqus
pkgver=0.2.1
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
sha512sums=('33051ae56231551c81ac71627887e856fb205d4f4db17b84c85e3b0a474a2a3138d23445015d190b449e3978dbd337e80aee4f5094901eb659cce8a968a35d26')
b2sums=('fcc6ef72304fdb11a3164a84ca378f68136c10596635c0436c5870f860837ff3c3a3d17a2874da04018fd4de8ece9ba32e3d8f21ca3ca05c3a108c954ee1e670')

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
