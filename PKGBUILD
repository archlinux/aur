# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=albion-online-staging-game-data-bin
pkgver=1.0.301.65558
pkgrel=1
pkgdesc="The first true cross-platform Sandbox MMO -- game data files for staging server"
url="https://albiononline.com/"
arch=('x86_64')
license=('custom')
depends=('libgl' 'gstreamer0.10-good' 'albion-online-launcher-bin')
source=("https://staging.albiononline.com/autoupdate/albiononline-linux-full-${pkgver}.zip" "albion-online-staging.desktop")
noextract=("albiononline-linux-full-${pkgver}.zip")

options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
md5sums=('b1ccd18abb7add0c967360a4c253f4ca'
         'ee67853c1786d80d3b1fd4a613ed0093')

PKGEXT='.pkg.tar'

package() {
  mkdir -p "${pkgdir}/opt/albion-online-launcher-bin/staging_x64"
  bsdtar --verbose --extract --directory "${pkgdir}/opt/albion-online-launcher-bin/staging_x64" --file "albiononline-linux-full-${pkgver}.zip"
  chmod +x "${pkgdir}/opt/albion-online-launcher-bin/staging_x64/Albion-Online"

  mkdir -p "${pkgdir}/usr/bin"
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/albion-online-staging"
  echo "/opt/albion-online-launcher-bin/staging_x64/Albion-Online" >> "${pkgdir}/usr/bin/albion-online-staging"
  chmod +x "${pkgdir}/usr/bin/albion-online-staging"

  # install .desktop file
  install -m755 -D "${srcdir}/albion-online-staging.desktop" -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:

