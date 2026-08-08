# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

pkgname=wayfreeze
pkgver=0.2.0
pkgrel=1
pkgdesc='Tool to freeze the screen of a Wayland compositor'
arch=('x86_64')
url='https://github.com/Jappie3/wayfreeze'
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc' 'libxkbcommon' 'wayland')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jappie3/wayfreeze/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('f8ad11e8b71cb21240bfd73787f8b1ebbbd921b2aba931d4639473615801574dd831418cfee15aa6d9516c20a6cc7f1556db96f6f881791b0313a66500092a76')

prepare() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN="stable"
	cargo fetch --locked --target host-tuple
}

build() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN="stable"
	export CARGO_TARGET_DIR="target"
	cargo build --frozen --release --all-features
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
