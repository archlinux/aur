# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=squiid
pkgver=1.1.0
pkgrel=1
pkgdesc="Advanced calculator written in Rust, featuring a terminal user interface supporting both RPN and algebraic input."
arch=('any')
url="https://gitlab.com/ImaginaryInfinity/squiid-calculator/squiid"
license=('GPLv3')
makedepends=('cargo' 'cmake')
source=("https://gitlab.com/ImaginaryInfinity/squiid-calculator/squiid/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('85c07828fffb2c203d0e11cc9b6c06b0a6decffa637ee4bd3da862a292a0f68af0d4cd9b38d4d247c86190a0c4649a7bbdbe79e5f205b2f3933b984b51589183')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features -p squiid -p squiid-engine -p squiid-parser
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "branding/squiidsquare.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/squiid.svg"
	install -Dm644 "branding/icons/squiid512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/squiid.png"
	install -Dm644 "branding/icons/squiid256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/squiid.png"
	install -Dm644 "branding/icons/squiid128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/squiid.png"
	install -Dm644 "branding/icons/squiid64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/squiid.png"
	install -Dm644 "branding/icons/squiid32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/squiid.png"
	install -Dm644 "branding/icons/squiid16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/squiid.png"
	install -Dm644 "packages/squiid.desktop" "$pkgdir/usr/share/applications/squiid.desktop"
}