# Maintainer: NorthWestWind <nw@northwestw.in>
_pkgname=cls
pkgname=$_pkgname-rs
pkgver=2.1.1
pkgrel=1
pkgdesc="cls - Command-Line Soundboard written in Rust"
arch=("i686" "x86_64")
url="https://codeberg.org/NorthWestWind/cls"
license=('GPL3')
depends=("ffmpeg" "pulse-native-provider")
makedepends=("cargo")
replaces=("cls-soundboard")
conflicts=("cls-rs-git" "cls-rs-bin")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("e569c468371a8a4ac6433cd1d132b8c81b6a1f1378f67ad8c083baed2ee00f57")

prepare() {
  export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$srcdir/$_pkgname"
	cargo build --locked --frozen --release --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_pkgname/target/release/$_pkgname"
}
