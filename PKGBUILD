# Maintainer: Pest <ppest@protonmail.com>
pkgname=devault
pkgver=1.1.2
pkgrel=1
pkgdesc="QT Desktop wallet for the dvt blockchain"
arch=('x86_64')
license=('MIT')
url="https://github.com/devaultcrypto/"
source=(${pkgname}-${pkgver}::\
https://github.com/devaultcrypto/devault/archive/v${pkgver}.tar.gz)
depends=('boost-libs' 'qt5-base' 'qrencode' 'zeromq' 'miniupnpc' 'hicolor-icon-theme' 'libevent')
makedepends=('python' 'boost' 'qt5-tools')
md5sums=('9d35572930e4aeec7089d9cf930ab50a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr/
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 \
   contrib/debian/devault-qt.desktop \
   "${pkgdir}/usr/share/applications/devault-qt.desktop"
  install -D -m644 \
   share/pixmaps/devault-128.png \
   "${pkgdir}/usr/share/icons/hicolor/128x128/apps/devault-128.png"
  install -D -m644 COPYING  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

