# Maintainer: Sir-Photch <sir-photch at posteo dot me>

pkgname=adguardian
_pkgname=AdGuardian-Term
pkgver=1.6.0
pkgrel=1
pkgdesc="Terminal-based, real-time traffic monitoring and statistics for your AdGuard Home instance"
arch=(x86_64)
url="https://github.com/Sir-Photch/dab-rs"
license=(MIT)
makedepends=(cargo)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Lissy93/$_pkgname/archive/refs/tags/$pkgver.tar.gz")

sha512sums=('385c61d7a48946df2da59f4fa95e96e72cdf80daf7da3b08d6190c79cc72fde6368439e9781fca9ebae97f3d0f07d3e4f82be9f9c3d8aa5675176d967139e31c')

prepare() {
	cd "$_pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
    	cd "$_pkgname-$pkgver"

    	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 .github/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
