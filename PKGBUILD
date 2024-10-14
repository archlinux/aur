# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=squiid
pkgver=1.1.3
pkgrel=1
pkgdesc="Advanced calculator written in Rust, featuring a terminal user interface supporting both RPN and algebraic input."
arch=('any')
url="https://gitlab.com/ImaginaryInfinity/squiid-calculator/squiid"
license=('GPLv3')
makedepends=('cargo' 'cmake')
source=("https://gitlab.com/ImaginaryInfinity/squiid-calculator/squiid/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d840023b368fe47a80d9a70e5853055406d5ee5c80344ed959323c0e4139d55ac3c617fe9ffb306e9d7ac5ae2ba34867c4e8794009aba65bf26c13747bdb3c56')

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