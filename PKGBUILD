# Maintainer:  ElXreno <elxreno@gmail.com>

pkgname=rescuetime2
pkgver=2.14.3.1
pkgrel=3
pkgdesc="Application time-tracking for Linux. Stable version"
arch=('i686' 'x86_64')
url=https://www.rescuetime.com
license=('proprietary')
depends=('qt5-base' 'xorg-xprop' 'xprintidle')
makedepends=('gendesk')
conflicts=('rescuetime')
source_i686=("${pkgname}_${pkgver}_i686.deb"::"$url/installers/rescuetime_current_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_amd64.deb"::"$url/installers/rescuetime_current_amd64.deb")
sha256sums_i686=('a6179d27df565b2ec16b31d206bd29fd65bd51651609a728de23084690c8c574')
sha256sums_x86_64=('51563c57689d364c93f2d6740b46f3089bc6d5338b105bc897d11d2577f2730d')

pkgver() {
    grep Version control | cut --fields=2 -d' '
}

prepare() {
    bsdtar -xf control.tar.gz control
    bsdtar -xf data.tar.xz
    gendesk -f --pkgname="RescueTime" --pkgdesc="$pkgdesc" --categories=Office --exec=rescuetime
}

package() {
    install -Dm644 {,"$pkgdir"/}usr/share/rescuetime/curl-ca-bundle.crt
    install -Dm755 {,"$pkgdir"/}usr/bin/rescuetime
    install -Dm644 "$srcdir"/RescueTime.desktop -t "$pkgdir"/usr/share/applications
}

post_install() {
  echo "Firefox Add-on:   https://addons.mozilla.org/en-us/firefox/addon/rescuetime-for-firefox/"
  echo "Chrome Extension: https://chrome.google.com/webstore/detail/bdakmnplckeopfghnlpocafcepegjeap"
}
