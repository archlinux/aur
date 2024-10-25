# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=cls
pkgname=$_pkgname-rs
pkgver=1.2.0
pkgrel=1
pkgdesc="cls - Command-Line Soundboard written in Rust"
arch=("i686" "x86_64")
url="https://github.com/North-West-Wind/cls"
license=('GPL3')
depends=("ffmpeg" "pulse-native-provider")
makedepends=("cargo")
replaces=("cls-soundboard")
conflicts=("cls-rs-git" "cls-rs-bin")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("cad4e10738d8f92ac5bdac1e6ce5ced6a1248c13818d3ec8999321a9f5f8cde9")

prepare() {
  export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$_pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$srcdir/$_pkgname-$pkgver"
	cargo build --locked --frozen --release --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname"
}
