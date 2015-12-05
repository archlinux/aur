# Please download sources on fosshub.com on the following link: http://www.fosshub.com/FossaMail.html
# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
pkgname=fossamail-bin
pkgver=25.1.9
pkgrel=1
pkgdesc="Open Source, Mozilla Thunderbird-based mail, news and chat client based on the Pale Moon browser core."
arch=('i686' 'x86_64')
url="http://www.fossamail.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib')
provides=("fossamail=$pkgver")
conflicts=('fossamail')
install=fossamail.install
source=(fossamail.desktop)
source_i686=(https://github.com/iPotable/FossaMailBinaries/raw/master/FossaMail-${pkgver}.en-US.linux-i686.tar.bz2)
source_x86_64=(https://github.com/iPotable/FossaMailBinaries/raw/master/FossaMail-${pkgver}.en-US.linux-x86_64.tar.bz2)
sha1sums=('6d19278e2af83290c83cc063b6447476b5f58fd8')
sha1sums_i686=('9a7e78a9aa2e5c5f886e1479ae11ce39f8d5f7aa')
sha1sums_x86_64=('0399312aa747ab793910609c5f4d5435dc66bc9b')

package() {
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r FossaMail/ "$pkgdir/usr/lib/fossamail"
  ln -s ../lib/fossamail/FossaMail "$pkgdir/usr/bin/fossamail"
  install -Dm644 fossamail.desktop "$pkgdir/usr/share/applications/fossamail.desktop"

  # icons
  install -Dm644 FossaMail/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/fossamail.png"

  # avoid duplicate binaries
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf fossamail "$pkgdir/usr/lib/fossamail/fossamail-bin"
}