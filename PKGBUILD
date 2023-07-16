# Author: Julius Michaelis <lls@liftm.de>
pkgname=list-listening-sockets
pkgver=0.2.0
pkgrel=1
pkgdesc="Tool for listing listening sockets"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/jcaesar/lls"
license=("MIT")
makedepends=("rust")
provides=("list-listening-sockets")
source=("$pkgname-$pkgver.tgz::https://crates.io/api/v1/crates/lls/$pkgver/download")
sha256sums=("682c4f58d83c841fbb89f9f282ef0cc0e537834b869c87750b37f6148119c72c")
b2sums=("9eda05b5293c6cd793731bfb54fbe83ed589e605d3fa11e6c329d7599788ca08f6339ca378cf3ec8f7dc6a7bd0cc410fc021cfd4276dadb3cd12d7a388a42e68")

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
