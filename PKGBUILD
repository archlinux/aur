# Maintainer: Asyrique Thevendran <asyrique+AUR@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: kaptoxic dragos240
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=rescuetime
pkgver=2.10.1.1355
pkgrel=1
pkgdesc="Application time-tracking for Linux. Stable version"
arch=('i686' 'x86_64')
url=https://www.rescuetime.com
license=('GPL2')
depends=('qt4' 'xorg-xprop' 'xprintidle')
source_i686=("${pkgname}_${pkgver}_i686.deb"::"$url/installers/${pkgname}_current_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_amd64.deb"::"$url/installers/${pkgname}_current_amd64.deb")
sha256sums_i686=('25bda638157955d73cf1e48bb0d28f2ab1026fa8bd2cf5853ef99e2de7d0f1e6')
sha256sums_x86_64=('2d8b970f9d0ac73974cf3c2717340702f4beb450a8945263cbd6c375b199e3d3')

pkgver() {
    grep Version control | cut --fields=2 -d' '
}

prepare() {
    bsdtar -xf control.tar.gz control
    bsdtar -xf data.tar.xz
}

package() {
    install -Dm644 {,"$pkgdir"/}usr/share/$pkgname/curl-ca-bundle.crt
    install -Dm755 {,"$pkgdir"/}usr/bin/$pkgname
}

post_install() {
  echo "Firefox Add-on:   https://addons.mozilla.org/en-us/firefox/addon/rescuetime-for-firefox/"
  echo "Chrome Extension: https://chrome.google.com/webstore/detail/bdakmnplckeopfghnlpocafcepegjeap"
}
