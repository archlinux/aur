# Maintainer: Silas Groh <rubixdev@mailfence.com>
pkgname=pixterm-rust
cratename=pixterm
pkgver=0.4.0
pkgrel=2
pkgdesc='CLI to show images in a terminal'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/RubixDev/pixterm'
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('pixterm')
source=("$cratename-$pkgver.tar.gz::https://static.crates.io/crates/$cratename/$cratename-$pkgver.crate")
b2sums=('f995ee23a445b8b6bb18d84d03dc90f7d47542d3d28c7e91a823027cb6e171f0888a900458dda1f910f6e192cf7b54a2e43b305bc2905215e366a79883a17c8d')

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
