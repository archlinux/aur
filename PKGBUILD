# Maintainer: Arnoldas Rauba (raubarno)

pkgname=audra
pkgver=0.3.1
pkgrel=1
pkgdesc="A bullet-hell Touhou fangame, written in Rust and Vulkan."
arch=('x86_64')
url='https://codeberg.org/raubarno/audra'
license=('GPL3')
depends=('libxkbcommon-x11' 'vulkan-icd-loader')
makedepends=('gcc' 'cmake' 'cargo' 'git' 'shaderc')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/raubarno/audra/archive/v$pkgver.tar.gz")
sha512sums=('68a5936c43c6cb19a49e55759d52cd9a09ae9f1bdb6991f1070330c65260642fdce84a0d313b75bdf4487f07c1ef18b7c9cf6644df62d98aa71f1dcf08668060')

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
