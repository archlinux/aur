# Maintainer: Silas Groh <rubixdev@mailfence.com>
pkgname=pixterm-rust
cratename=pixterm
pkgver=0.1.0
pkgrel=1
pkgdesc='CLI to show images in a terminal'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/RubixDev/pixterm'
license=('GPL3')
depends=()
makedepends=('cargo')
conflicts=('pixterm')
source=("$cratename-$pkgver.tar.gz::https://static.crates.io/crates/$cratename/$cratename-$pkgver.crate")
sha256sums=('1543d496f8c2f9e1260b42006f3e3cec4c1d010b90ec6d2710a75a4d1dfe3ade')

prepare() {
    cd "$srcdir/$cratename-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$cratename-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

# check() {
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --frozen --all-features
# }

package() {
    cd "$srcdir/$cratename-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$cratename"
}
