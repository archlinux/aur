# Maintainer: Sebastian Jug <sebastianDOTjugATgmailDOTcom>
#

pkgname=trezor-bridge-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Standalone application to use the trezor hardware bitcoin wallet with your computer"
arch=('i686' 'x86_64')
url="https://mytrezor.com/"
license=('LGPL3')
depends=('curl' 'libmicrohttpd' 'libusb')
makedepends=()
options=()
install=$pkgname.install
source_i686=("https://wallet.mytrezor.com/data/bridge/${pkgver}/trezor-bridge_${pkgver}_i386.deb")
source_x86_64=("https://wallet.mytrezor.com/data/bridge/${pkgver}/trezor-bridge_${pkgver}_amd64.deb")
sha256sums_i686=('1f0b10541e5a9f54bc73aa0d985233d2d4c88f391fb7997633a035ed286ceb55')
sha256sums_x86_64=('7544eae4f1fd0238bfd67ec908925da2a94824167f500e4fa91d9764a2c7f7c7')

package() {
    msg2 "Extracting the data..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    msg2 "Fixing file structure..."
    mv "$pkgdir"/lib/udev/ "$pkgdir"/usr/lib/
    
    msg2 "Removing init scripts, and cleaning up..."
    rm -r "$pkgdir"/etc/ "$pkgdir"/lib/
}
