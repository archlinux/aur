# Maintainer: Joey Li https://joeyli.dev
pkgname=weather-rs
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Weather App made to run in the terminal written in Rust"
arch=('x86_64')
url="https://github.com/einstein8612/weather-rs"
license=('MIT')
groups=()
depends=()
makedepends=("cargo")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('61c0fff71b4995c94e8bb145939de2987a6f6da7f2a0d68dbb140fb603d93aa2')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo update
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
	rm -f target/release/weather
	mv target/release/weather-rs target/release/weather
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
  	cargo test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/weather" -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
