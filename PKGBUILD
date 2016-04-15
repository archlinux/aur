# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=fossamail-bin
pkgver=25.2.1
pkgrel=1
pkgdesc="Open Source, Mozilla Thunderbird-based mail, news and chat client based on the Pale Moon browser core."
arch=('i686' 'x86_64')
url="http://www.fossamail.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib')
provides=("fossamail=$pkgver")
conflicts=('fossamail' 'fossamail-git')
install=fossamail.install
source=(fossamail.desktop)
source_i686=(http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.en-US.linux-i686.tar.bz2)
source_x86_64=(http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.en-US.linux-x86_64.tar.bz2)
sha256sums=('4d7b71a153f662abaab5f85fa8371c674d58aaffbaabc428b0b56359be8caacd')
sha256sums_i686=('ae32326e72260d7f6c141b9c572c3be7b23e33013025f444817514d79c4d7305')
sha256sums_x86_64=('92c73480732f1f0502448041be35c7847a605e449ce64708b6a38865784e74d8')

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