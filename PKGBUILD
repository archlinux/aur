# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=cls
pkgname=$_pkgname-rs
pkgver=1.3.0
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
sha256sums=("a6a5a5d5fdfedf039e601f8e58ce19ebd82055bc8dd9c5c479b8fb120002f8f8")

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
