# Maintainer: Pest <ppest@protonmail.com>
_pkgname=devault
pkgname="${_pkgname}core"
pkgver=1.1.7
pkgrel=1
pkgdesc="QT Desktop wallet for the dvt blockchain"
arch=('x86_64')
license=('MIT')
url="https://github.com/devaultcrypto/"
conflicts=("${pkgname}-git")
source=(${_pkgname}::\
https://github.com/devaultcrypto/devault/archive/v${pkgver}.tar.gz)
depends=('boost-libs' 'qt5-base' 'qrencode' 'zeromq' 'miniupnpc' \
        'hicolor-icon-theme' 'libevent')
makedepends=('python' 'boost' 'qt5-tools' 'gcc<10.0.0')
md5sums=('1771f4890533249876ccf5e9a0349e52')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr/
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 \
   contrib/debian/devault-qt.desktop \
   "${pkgdir}/usr/share/applications/devault-qt.desktop"
  install -D -m644 \
   share/pixmaps/devault-128.png \
   "${pkgdir}/usr/share/icons/hicolor/128x128/apps/devault-128.png"
  install -D -m644 COPYING  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
