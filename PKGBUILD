# Author: Julius Michaelis <lls@liftm.de>
pkgname=list-listening-sockets
pkgver=0.4.1
pkgrel=1
pkgdesc="Tool for listing listening sockets"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/jcaesar/lls"
license=("MIT")
makedepends=("rust")
provides=("list-listening-sockets")
source=("$pkgname-$pkgver.tgz::https://crates.io/api/v1/crates/lls/$pkgver/download")
sha256sums=("eeef4c17ba78581901321286262032b9a4c268fa9b7421301c267b5bc10d206f")
b2sums=("80857703005d74096e8d586a916684ed45cc71ec4c49d0ee2c599735362272c69513eca1f2cf01130f541f3d654b64483169203ab42b4534a5b621045f8ebefb")

prepare() {
	cd lls-${pkgver}
	cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
	cd lls-${pkgver}
	cargo build --profile minsize --frozen
}

package() {
	cd lls-${pkgver}
	install -Dm 755 target/minsize/lls -t "${pkgdir}/usr/bin"
}
