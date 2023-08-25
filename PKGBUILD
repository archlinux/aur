# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="hulk-rs"
pkgver=1.2.3
pkgrel=1
pkgdesc="HULK DoS tool ported to Rust with additional features"
url="https://github.com/Hexalyse/hulk-rs"
license=("GPL-3.0")
arch=("x86_64" "aarch64" "armv7h")
provides=("hulk-rs")
conflicts=("hulk-rs-bin")
makedepends=("cargo")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ac5238cf3069d33689a8ecee213f3e4eecfe681a79e0ae859a560175643e1764')

prepare(){
 cd "$pkgname-$pkgver"
 export RUSTUP_TOOLCHAIN=stable
 cargo update
 cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build(){
 cd "$pkgname-$pkgver"
 export RUSTUP_TOOLCHAIN=stable
 export CARGO_TARGET_DIR=target
 cargo build --frozen --release --all-features
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
