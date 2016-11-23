# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=albion-online-launcher-bin
pkgver=20161123103252
pkgrel=1
pkgdesc="The first true cross-platform Sandbox MMO -- launcher client"
url="https://albiononline.com/"
arch=('x86_64')
license=('custom')
depends=('libgl' 'gstreamer0.10-good')
optdepends=(albion-online-live-game-data-bin albion-online-staging-game-data-bin)
source=(${pkgname}-${pkgver}.zip::"https://live.albiononline.com/clients/${pkgver}/albion-online-setup" "albion-online-launcher.desktop")

options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
md5sums=('671c1b785b68c31928f0899f535ed855'
         '14b5dfae0a7b3b0dc5e2f2975aa4892c')

package() {
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/data" "${pkgdir}/opt/${pkgname}"

  mkdir ${pkgdir}/opt/${pkgname}/staging_x64
  chmod 777 ${pkgdir}/opt/${pkgname}/staging_x64

  mkdir ${pkgdir}/opt/${pkgname}/game_x64
  chmod 777 ${pkgdir}/opt/${pkgname}/game_x64
  
  # link launcher exe
  mkdir -p ${pkgdir}/usr/bin
  ln -s "/opt/$pkgname/Albion-Online" "${pkgdir}/usr/bin/albion-online-launcher"

  # install .desktop file
  install -m755 -D ${srcdir}/albion-online-launcher.desktop -t ${pkgdir}/usr/share/applications
}

# vim:set ts=2 sw=2 et:

