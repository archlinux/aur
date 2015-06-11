# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xtux
pkgver=20030306
pkgrel=1
pkgdesc="A Gauntlet-style arcade game for X11 with multiplayer mode"
arch=('i686' 'x86_64')
url="http://xtux.sourceforge.net/"
license=('GPL')
depends=('libxpm')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-src-${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.desktop")
md5sums=('6ca5d3b48c30411d1a64b4316d5cf6a9'
         'd04e19ea067837eda0f1ce066d9c8f3a'
         '504541ae6fadcb6d56387aedda475979')

build() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "../${pkgname}.patch"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install binaries
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${pkgname}" tux_serv "${pkgdir}/usr/bin"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r data/* "${pkgdir}/usr/share/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 data/images/icon.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS CHANGELOG README* "${pkgdir}/usr/share/doc/${pkgname}"
}
