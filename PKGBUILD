# Maintainer: Sebastian Jug <sebastianDOTjugATgmailDOTcom>
#

pkgname=trezor-bridge-bin
pkgver=1.2.0
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
sha256sums_i686=('ef156e38f7622c4033839e7adac16f9744b27d6554c786e9e8d2d814f19c89e6')
sha256sums_x86_64=('1eba299bcd96be68b675efe5935705cccf013c8b7a452497d83b3ca4bba23297')

package() {
    msg2 "Extracting the data..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    msg2 "Fixing file structure..."
    mv "$pkgdir"/lib/udev/ "$pkgdir"/lib/jsoncpp/ -t "$pkgdir"/usr/lib/
    
    msg2 "Removing init scripts, and cleaning up..."
    rm -r "$pkgdir"/etc/ "$pkgdir"/lib/ "$pkgdir"/usr/lib/jsoncpp/CMakeFiles/CMakeTmp/
}
