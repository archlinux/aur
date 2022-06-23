# Maintainer: Silas Groh <rubixdev@mailfence.com>
pkgname=pixterm-rust
cratename=pixterm
pkgver=0.3.0
pkgrel=1
pkgdesc='CLI to show images in a terminal'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/RubixDev/pixterm'
license=('GPL3')
depends=()
makedepends=('cargo')
conflicts=('pixterm')
source=("$cratename-$pkgver.tar.gz::https://static.crates.io/crates/$cratename/$cratename-$pkgver.crate")
b2sums=('c88cc149572e031f02ac50d170bb98bcca9b21c178cb823ca868202962eb9448fa4cf95e7ffcb0a47f9756ebc61ad8ee23626e604e78bb9da7c2e315c3b2df33')

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
