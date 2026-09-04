# Maintainer: Aspenini <aspeninifeltner@gmail.com>

pkgname=numeron
pkgver=0.2.0
pkgrel=1
pkgdesc='Resumable hardware-aware calculator for pi, e, RSA factoring, and more'
arch=('x86_64')
url='https://github.com/Aspenini/numeron'
license=('MIT')

depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
optdepends=('nvidia-utils: NVIDIA GPU detection')

source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('SKIP')

prepare() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}

check() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo test --frozen
}

package() {
    cd "$pkgname"

    install -Dm0755 -t "$pkgdir/usr/bin/" \
        target/release/numeron
}
