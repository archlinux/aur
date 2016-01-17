# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=albiononline
pkgver=20160116232309
pkgrel=1
pkgdesc="The first true cross-platform Sandbox MMO"
url="https://albiononline.com/"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('unzip')
depends=('libgl')
source=("https://live.albiononline.com/clients/${pkgver}/albion-online-setup" "albiononline.desktop")
md5sums=('462f30c938c0988a28232fda54b5d21b'
         'cec7e1ad7f4f8acfc0628d0dd8d421e6')

options=(!strip docs libtool emptydirs !zipman staticlibs !upx)


package() {
  mkdir -p "${pkgdir}/opt/albiononline"
  mv data/* "${pkgdir}/opt/albiononline/."

  # this fixes a bug in how the dirs are unpacked
  mv ${pkgdir}/opt/albiononline/launcher/launcher ${pkgdir}/opt/albiononline/launcher.tmp
  rm -rf ${pkgdir}/opt/albiononline/launcher/
  mv ${pkgdir}/opt/albiononline/launcher.tmp ${pkgdir}/opt/albiononline/launcher
  
  # install .desktop file
  install -D -t ${pkgdir}/usr/share/applications ${pkgname}.desktop
}

# vim:set ts=2 sw=2 et:
