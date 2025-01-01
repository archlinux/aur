# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=squiid
pkgver=1.2.0
pkgrel=2
pkgdesc="Advanced calculator written in Rust, featuring a terminal user interface supporting both RPN and algebraic input."
arch=('any')
url="https://gitlab.com/ImaginaryInfinity/squiid-calculator/squiid"
license=('GPLv3')
makedepends=('cargo')
source=("https://gitlab.com/ImaginaryInfinity/squiid-calculator/squiid/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ba7477b8592c036d04b2487b49603fa9dd109a9175e801609dee557ddf39a6d3647ee4b47552665a2cca1b9b1b46c83e2a3d8f993d8306164c8d45c4ac19093c')
options=(strip !debug)

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen -p squiid -p squiid-engine -p squiid-parser
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
