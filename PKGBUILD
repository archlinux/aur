# Maintainer: Arnoldas Rauba (raubarno)

pkgname=audra
pkgver=0.3.0
pkgrel=1
pkgdesc="A bulet-hell Touhou fangame, written in Rust and Vulkan."
arch=('x86_64')
url='https://codeberg.org/raubarno/audra'
license=('GPL3')
depends=('libxkbcommon-x11' 'vulkan-icd-loader')
makedepends=('gcc' 'cmake' 'cargo' 'git' 'shaderc')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/raubarno/audra/archive/v$pkgver.tar.gz")
sha512sums=('980b4b9ba3155b297a467a3ded03d669ad1d64bf85938a365485225b73aa60ff8f00c64eb9044d50f05d99540a77e80c901f98e2d736caa1ac4f2fc2b6aeaf49')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname"
	cargo test --frozen --release
}

package() {
	install -Dm0755 "$pkgname/target/release/$pkgname" -t "$pkgdir/usr/bin"
}
