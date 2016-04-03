# Maintainer: Sebastian Jug <sebastianDOTjugATgmailDOTcom>
#

pkgname=trezor-bridge-bin
pkgver=1.1.3
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
sha256sums_i686=('2b5cf70dd2b5d5bd3df77375dace5242c7e7fc104651d086106d3b2038a564f7')
sha256sums_x86_64=('079600f4c39699f71243904925d96584420773015328cc5fd7edb0ef739f14b3')

package() {
    msg2 "Extracting the data..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    msg2 "Fixing file structure..."
    mv "$pkgdir"/lib/udev/ "$pkgdir"/lib/jsoncpp/ -t "$pkgdir"/usr/lib/
    
    msg2 "Removing init scripts, and cleaning up..."
    rm -r "$pkgdir"/etc/ "$pkgdir"/lib/ "$pkgdir"/usr/lib/jsoncpp/CMakeFiles/CMakeTmp/
}
