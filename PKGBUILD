# Maintainer: Sergey Kasmy <sergey.kasmy [at] gmail.com>

pkgname=elapsed
pkgver=0.2.0
pkgrel=1
pkgdesc='Show runtime while a command runs'
url='https://github.com/jwodder/elapsed'
license=('MIT')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c880429d90be81825a4f5472f9d69d0b1d7b8ef754c7c06f6b92b9d03185540d')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

