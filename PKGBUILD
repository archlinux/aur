# Maintainer:  ElXreno <elxreno@gmail.com>

pkgname=rescuetime2
pkgver=2.16.4.2
pkgrel=1
pkgdesc="Application time-tracking for Linux. Stable version"
arch=('i686' 'x86_64')
url=https://www.rescuetime.com
license=('proprietary')
depends=('sqlite' 'qt5-base' 'xorg-xprop' 'xprintidle')
makedepends=('gendesk')
conflicts=('rescuetime')
source_i686=("${pkgname}_${pkgver}_i686.deb"::"$url/installers/rescuetime_current_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_amd64.deb"::"$url/installers/rescuetime_current_amd64.deb")
sha256sums_i686=('8cc898a7e6685dbe316c6c2072123a347a6cb08d45e0b0478848ba3c6ca2ca7f')
sha256sums_x86_64=('9b1960b71049175ead560f555b7387ea5e187c9d0a69ec2c8d3cdc08fbb4750d')

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
