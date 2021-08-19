# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=nobleNote

pkgname=noblenote
pkgver=1.2.1
pkgrel=2
pkgdesc='A cross-platform note taking application'
arch=('x86_64')
url="https://github.com/hakaishi/nobleNote"
license=('MIT')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://github.com/hakaishi/nobleNote/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('17c42dec89eafcfd9b3fa0c104fbfed46a5e1ef110159292199621cd33e54813')

build() {
  cd "${_srcname}-${pkgver}"
  qmake
  make
}

package() {
  cd "${_srcname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  cp -r screenshot "${pkgdir}/usr/share/doc/${pkgname}/screenshot"
  sed -i "s/\/screenshot\//screenshot\//g" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 noblenote.desktop "${pkgdir}/usr/share/applications/noblenote.desktop"
  ln -s "./noblenote-icons/noblenote_128x128.png" "${pkgdir}/usr/share/pixmaps/noblenote_128x128.png"
  ln -s "./noblenote-icons/noblenote_32x32.png" "${pkgdir}/usr/share/pixmaps/noblenote_32x32.png"
  ln -s "./noblenote-icons/noblenote_64x64.png" "${pkgdir}/usr/share/pixmaps/noblenote_64x64.png"
  ln -s "./noblenote-icons/noblenote.png" "${pkgdir}/usr/share/pixmaps/noblenote.png"
  ln -s "./noblenote-icons/noblenote.xpm" "${pkgdir}/usr/share/pixmaps/noblenote.xpm"
}
