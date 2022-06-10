# Maintainer: Silas Groh <rubixdev@mailfence.com>
pkgname=pixterm-rust
cratename=pixterm
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI to show images in a terminal'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/RubixDev/pixterm'
license=('GPL3')
depends=()
makedepends=('cargo')
conflicts=('pixterm')
source=("$cratename-$pkgver.tar.gz::https://static.crates.io/crates/$cratename/$cratename-$pkgver.crate")
sha256sums=('0dab4e1dbaa821cf9ad1911050ca18be5764d44e5561a391a9ada355f8eb5047')

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
