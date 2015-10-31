# Maintainer: Sebastian Jug <sebastianDOTjugATgmailDOTcom>
#

pkgname=trezor-bridge-bin
pkgver=1.1.2
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
sha256sums_i686=('a604a65e0f380453db10c9ecb733bc35078f3b47b7cf2d2ff0f57b5e4d288e2d')
sha256sums_x86_64=('576e17cc6dbe8f9d59f69014102b1ab8544cd39ce283cd30387719cb4a2aaf88')

package() {
    msg2 "Extracting the data..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    msg2 "Fixing file structure..."
    mv "$pkgdir"/lib/udev/ "$pkgdir"/lib/jsoncpp/ -t "$pkgdir"/usr/lib/
    
    msg2 "Removing init scripts, and cleaning up..."
    rm -r "$pkgdir"/etc/ "$pkgdir"/lib/ "$pkgdir"/usr/lib/jsoncpp/CMakeFiles/CMakeTmp/
}
