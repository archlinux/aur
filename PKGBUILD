# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=fossamail-bin
pkgver=25.2.0
pkgrel=4
pkgdesc="Open Source, Mozilla Thunderbird-based mail, news and chat client based on the Pale Moon browser core."
arch=('i686' 'x86_64')
url="http://www.fossamail.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib')
provides=("fossamail=$pkgver")
conflicts=('fossamail' 'fossamail-git')
install=fossamail.install
DLAGENTS="http::/usr/bin/echo $(tput bold)$(tput setaf 1)Please download manually the FossaMail binaries with a web browser from %u and move it to the PKGBUILD directory."
source=(fossamail.desktop)
source_i686=("FossaMail-${pkgver}.en-US.linux-i686.tar.bz2::http://www.fosshub.com/FossaMail.html/FossaMail-${pkgver}.en-US.linux-i686.tar.bz2")
source_x86_64=("FossaMail-${pkgver}.en-US.linux-x86_64.tar.bz2::http://www.fosshub.com/FossaMail.html/FossaMail-${pkgver}.en-US.linux-x86_64.tar.bz2")
sha256sums=('4d7b71a153f662abaab5f85fa8371c674d58aaffbaabc428b0b56359be8caacd')
sha256sums_i686=('7b4ae9081bc623072ecf08caee578f5e76cb6bc5cfb218cee94603724b66cd01')
sha256sums_x86_64=('422ca75395e47df9eeee721b47b5cb4be25cde4f29345815c9456acc1927a823')

package() {
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r FossaMail/ "$pkgdir/usr/lib/fossamail"
  ln -s ../lib/fossamail/FossaMail "$pkgdir/usr/bin/fossamail"
  install -Dm644 fossamail.desktop "$pkgdir/usr/share/applications/fossamail.desktop"

  # icons
  install -Dm644 FossaMail/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default22.png \
    "$pkgdir/usr/share/icons/hicolor/22x22/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default24.png \
    "$pkgdir/usr/share/icons/hicolor/24x24/apps/fossamail.png"
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