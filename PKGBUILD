# Maintainer: Sebastian Jug <sebastianDOTjugATgmailDOTcom>
#

pkgname=trezor-bridge-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Standalone application to use the trezor hardware bitcoin wallet with your computer"
arch=('i686' 'x86_64')
url="https://mytrezor.com/"
license=('LGPL3')
depends=('curl' 'libmicrohttpd' 'libusb')
makedepends=()
options=()
install=$pkgname.install
source_i686=("https://mytrezor.s3.amazonaws.com/bridge/${pkgver}/trezor-bridge_${pkgver}_i386.deb")
source_x86_64=("https://mytrezor.s3.amazonaws.com/bridge/${pkgver}/trezor-bridge_${pkgver}_amd64.deb")
sha256sums_i686=('9667bc2252137e9f9a1162149e87ede9a21ffe08731b9f6d0127b85659c203aa')
sha256sums_x86_64=('c13d1d74ea1f6c24c075afc6778aec60fa7b7d272ed65c1dab06fdd632236296')

package() {
    msg2 "Extracting the data..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    msg2 "Fixing file structure..."
    mv "$pkgdir"/lib/udev/ "$pkgdir"/lib/jsoncpp/ -t "$pkgdir"/usr/lib/
    
    msg2 "Removing init scripts, and cleaning up..."
    rm -r "$pkgdir"/etc/ "$pkgdir"/lib/ "$pkgdir"/usr/lib/jsoncpp/CMakeFiles/CMakeTmp/
}
