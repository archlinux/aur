# Maintainer:  ElXreno <elxreno@gmail.com>

pkgname=rescuetime2
pkgver=2.16.5.1
pkgrel=2
pkgdesc="Application time-tracking for Linux. Stable version"
arch=('i686' 'x86_64')
url=https://www.rescuetime.com
license=('proprietary')
depends=('sqlite' 'qt5-base' 'xorg-xprop' 'xprintidle' 'inetutils')
makedepends=('gendesk')
conflicts=('rescuetime')
source_i686=("${pkgname}_${pkgver}_i686.deb"::"$url/installers/rescuetime_current_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_amd64.deb"::"$url/installers/rescuetime_current_amd64.deb")
sha256sums_i686=('0bb56c21225ecd6670ab7f95a140377489b7bf56976985d87281bd0881f73bf7')
sha256sums_x86_64=('3196ce133ffdc111f120d1ea8a17ce03a82d689a476cf7f718a519439507cf26')

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
