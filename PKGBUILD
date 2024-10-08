# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=cls
pkgname=$_pkgname-rs
pkgver=1.0.1
pkgrel=1
pkgdesc="cls - Command-Line Soundboard written in Rust"
arch=("i686" "x86_64")
url="https://github.com/North-West-Wind/cls"
license=('GPL3')
depends=("ffmpeg" "pulse-native-provider")
makedepends=("cargo")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("e3f69e757dd9ea0f76bc169b2e55a9042db02ca2bbe6e12b937cca206eac9c45")

prepare() {
  export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$_pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$srcdir/$_pkgname-$pkgver"
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$_pkgname-$pkgver"
	cargo test --frozen --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname"
}
