# Maintainer: Muhammad Nu'man <numany2k2005@gmail.com>
pkgname=talabulilm
pkgver=1.1.0
pkgrel=1
pkgdesc="Watch Ceramah Ustaz (Islamic lectures) from the terminal, a full-screen TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/numan89/talabulilm"
license=('MIT')
depends=('yt-dlp' 'mpv')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/numan89/talabulilm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5d378dd4d109bcdcadd1478794c65bb25453ff852ddba8ddf24fca2e8e5c831')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
	cargo test --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
