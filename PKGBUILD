# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=cls
pkgname=$_pkgname-soundboard
pkgver=1.0.0
pkgrel=1
pkgdesc="cls - Command-Line Soundboard"
arch=("i686" "x86_64")
url="https://github.com/North-West-Wind/cls"
license=('GPL3')
depends=("ffmpeg" "pulse-native-provider")
makedepends=("cargo")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("58ebd77eacf1ee59b7dc61317712f3704841256b4bce3daa402be96ecc068f12")

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
