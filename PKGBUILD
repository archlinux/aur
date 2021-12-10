# Maintainer: Andrea Callea <gacallea@mailfence.com>
# Contributor: Jakub Trnka <jakub.trnka@chainanalytics.net>
# Contributor: Sebastian Jug <seb@stianj.ug>

pkgname=trezor-bridge-bin
pkgver=2.0.30
pkgrel=4
pkgdesc="Communication daemon for TREZOR"
arch=('i686' 'x86_64' 'aarch64')
url="https://trezor.io/"
license=('LGPL3')
depends=('systemd')
makedepends=()
provides=('trezor-bridge' 'trezord' 'trezor-udev')
conflicts=('trezord-git' 'trezord-go' 'trezor-udev')
options=()
install="${pkgname}.install"
source_i686=("https://wallet.trezor.io/data/bridge/${pkgver}/trezor-bridge_${pkgver}_i386.deb")
source_x86_64=("https://wallet.trezor.io/data/bridge/${pkgver}/trezor-bridge_${pkgver}_amd64.deb")
source_aarch64=("https://wallet.trezor.io/data/bridge/${pkgver}/trezor-bridge_${pkgver}_arm64.deb")
sha256sums_i686=('70a3d2f68a6796014ed495a0138612518e681cb3ae91260d74651af8bf836438')
sha256sums_x86_64=('5b61650044b0a0aad8d1a7a611f4393bfa43ef3622c09600a0f5eee87d84017b')
sha256sums_aarch64=('6a2711536f132ab90a2edd86d917a29fad2a67ade1b1acd81c8f0f4297163c66')

package() {
    echo "Extracting the data..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    echo "Fixing file structure..."
    mv "$pkgdir"/lib/udev "$pkgdir"/usr/lib/
    
    echo "Cleaning up..."
    rm -r "$pkgdir"/lib/
}
