# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=fossamail-bin
pkgver=25.2.0
pkgrel=3
pkgdesc="Open Source, Mozilla Thunderbird-based mail, news and chat client based on the Pale Moon browser core."
arch=('i686' 'x86_64')
url="http://www.fossamail.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib')
provides=("fossamail=$pkgver")
conflicts=('fossamail' 'fossamail-git')
install=fossamail.install

DLAGENTS="https::/usr/bin/curl --header 'Host: download.fosshub.com' --header 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --header 'DNT: 1' --header 'Referer: http://www.fosshub.com/FossaMail.html' --header 'Connection: keep-alive' %u -o %o"

source=(fossamail.desktop)
source_i686=("https://download.fosshub.com/Protected/expiretime=1457587258;badurl=aHR0cDovL3d3dy5mb3NzaHViLmNvbS9Gb3NzYU1haWwuaHRtbA==/7169f03bbd678bf952f3f9b3ef2f8162aaba4dadfa48026102d0176647529d78/FossaMail/FossaMail-25.2.0.en-US.linux-i686.tar.bz2")
source_x86_64=("https://download.fosshub.com/Protected/expiretime=1457587258;badurl=aHR0cDovL3d3dy5mb3NzaHViLmNvbS9Gb3NzYU1haWwuaHRtbA==/f7d734212c6ae08dc1bf6bc027ad42746ac7320fd620204877aed879c6ec2faf/FossaMail/FossaMail-25.2.0.en-US.linux-x86_64.tar.bz2")
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