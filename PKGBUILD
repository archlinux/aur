# Maintainer: Pest <ppest@protonmail.com>
_pkgname=devault
pkgname="${_pkgname}core-git"
pkgver=r16757.e8b7c87eb
pkgrel=1
pkgdesc="QT Desktop wallet for the dvt blockchain"
arch=('x86_64')
license=('MIT')
url="https://github.com/devaultcrypto/"
conflicts=("${_pkgname}" "${_pkgname}core")
source=("git+https://github.com/devaultcrypto/${_pkgname}.git")
depends=('boost-libs' 'qt5-base' 'qrencode' 'zeromq' 'miniupnpc' 'hicolor-icon-theme' 'libevent')
makedepends=('python' 'boost' 'qt5-tools')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
}

build() {
  cd "${_pkgname}"
  ./configure --prefix=/usr/
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 \
   contrib/debian/devault-qt.desktop \
   "${pkgdir}/usr/share/applications/devault-qt.desktop"
  install -D -m644 \
   share/pixmaps/devault-128.png \
   "${pkgdir}/usr/share/icons/hicolor/128x128/apps/devault-128.png"
  install -D -m644 COPYING  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
