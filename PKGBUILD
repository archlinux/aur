# Maintainer: w0rty <mawo97 at gmail.com>
# Contributor: Pim Bliek <pim@pimbliek.nl>
# Contributor: Elvin L <elvin@eelviny.me>

pkgname=rocrail
pkgver=3357
pkgrel=2
pkgdesc="Innovative Model Railroad Control System"
arch=('x86_64')
url="http://wiki.rocrail.net/"
license=('Proprietary')
depends=('libusb' 'libsm' 'gtk3')
makedepends=('curl')
source=("https://wiki.rocrail.net/rocrail-snapshot/Debian/Rocrail-debian11-i64.zip" "rocview.desktop" "rocrail.desktop" "startrocrail.sh")
md5sums=('SKIP'
         'b3851071a1185e25a6e59471d955b098'
         'edc94290e0835812bc704dbe1d6a940f'
         '4ec3bcf8eb335068e8b177360e19d72d')

pkgver() {
  # I made it like this because i dont have the time to test and update every new daily version. Anyone can update the package themself just by reinstalling.
  grep "${srcdir}"/revision.info -e "Revision:" | awk '{print $2}'
}

package() {
  install -d "${pkgdir}/opt/rocrail"
  cp -r "${srcdir}/"* "${pkgdir}/opt/rocrail" -R

  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/startrocrail.sh" "${pkgdir}/usr/bin/rocrail"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 -t "${pkgdir}/usr/share/applications" rocview.desktop
  install -Dm644 -t "${pkgdir}/usr/share/applications" rocrail.desktop

  install -d "${pkgdir}/usr/share/pixmaps"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" rocrail.png

  #cleanup unnecessary files and wrong scripts
  rm $pkgdir/opt/rocrail/desktoplink.sh
  rm $pkgdir/opt/rocrail/update.sh
  rm $pkgdir/opt/rocrail/sysupdate.sh
  rm $pkgdir/opt/rocrail/startrocrail.sh
  rm $pkgdir/opt/rocrail/*.desktop
  rm $pkgdir/opt/rocrail/Rocrail-debian11-i64.zip

  chmod -R 755 $pkgdir/opt/rocrail
}
