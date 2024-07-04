# Maintainer: Arnoldas Rauba (raubarno)

pkgname=audra
pkgver=0.4.0
pkgrel=1
pkgdesc="A bullet-hell Touhou fangame, written in Rust and Vulkan."
arch=('x86_64')
url='https://codeberg.org/raubarno/audra'
license=('GPL3')
depends=('libxkbcommon-x11' 'vulkan-icd-loader')
makedepends=('gcc' 'cmake' 'cargo' 'git' 'shaderc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b5708897d52ac9e4f08ec754b6e9e51c98ed84ab018644826bc834a6194cc24fe3363d473b96b56f1f228fa92aaed455624d8a957e69c5fd08120d89426f49d8')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
	install -Dm0644 "$pkgname/assets/audra.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm0644 "$pkgname/assets/wicon.png" -T "$pkgdir/usr/share/icons/hicolor/48x48/apps/audra.png"
}
