# Maintainer: Alexander Thaller <aur+hstdb@alexander.thaller.ws>
pkgname=hstdb
pkgver=2.1.0
pkgrel=1
pkgdesc="Better history management for zsh."
arch=('x86_64')
url="https://github.com/AlexanderThaller/hstdb"
license=('MIT')
depends=('sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlexanderThaller/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1a29c81e52822823967178e53f9135ba66ed156ebe36145e778f48e8390e7e6b8420897d07d40dfc9434d3068fdbafc1831bf441d127d2f3ba42d7a2e686188e')

build() {
	cd "$pkgname-$pkgver"
	RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
