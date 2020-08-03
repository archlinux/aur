# Maintainer:  ElXreno <elxreno@gmail.com>

pkgname=rescuetime2
pkgver=2.16.1.1
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
sha256sums_i686=('1b511df7d65e29b6731a8abac8c77d6f8734bac306fccc4bcbf6dd5b2c79fe94')
sha256sums_x86_64=('884505760ec7dcaa2c12d4d28e6f9bc5770cdeb534eadef3fa012e0c1c8ff29d')

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
