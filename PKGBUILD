# Maintainer: Silas Groh <rubixdev@mailfence.com>
pkgname=pixterm-rust
cratename=pixterm
pkgver=0.1.2
pkgrel=1
pkgdesc='CLI to show images in a terminal'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/RubixDev/pixterm'
license=('GPL3')
depends=()
makedepends=('cargo')
conflicts=('pixterm')
source=("$cratename-$pkgver.tar.gz::https://static.crates.io/crates/$cratename/$cratename-$pkgver.crate")
sha256sums=('5b57c5e1ebbe14418592069e7026962677c7d28fa8f73ffd68229c61351bb67a')

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
