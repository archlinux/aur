# Maintainer:  ElXreno <elxreno@gmail.com>

pkgname=rescuetime2
pkgver=2.14.5.1
pkgrel=1
pkgdesc="Application time-tracking for Linux. Stable version"
arch=('i686' 'x86_64')
url=https://www.rescuetime.com
license=('proprietary')
depends=('qt5-base' 'xorg-xprop' 'xprintidle')
makedepends=('gendesk')
conflicts=('rescuetime')
source_i686=("${pkgname}_${pkgver}_i686.deb"::"$url/installers/rescuetime_current_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_amd64.deb"::"$url/installers/rescuetime_current_amd64.deb")
sha256sums_i686=('5e7cfba24fc1ef6d0ae6f27164dc7275238ce3aa44e2d8ee4a3df98f254d067d')
sha256sums_x86_64=('8730af600711f2f347f23e64c6e47b88c62494e468d5fdea046138b7f5f0cd02')

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
