# Maintainer Vincent Schweiger <vincent.schweiger@xolley.de>

pkgname=rget
pkgver=1.1.1
pkgrel=1
pkgdesc="Wget alternative"
arch=(x86_64)
license=('GPL')
makedepends=()
source=("https://github.com/legendary-cookie/rustutils/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")

prepare() {
    cd "$srcdir/rustutils-${pkgname}-${pkgver}"
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/rustutils-${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build -p ${pkgname} --frozen --release --all-features
}


package() {
    cd "$srcdir/rustutils-${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
}


#vim: syntax=sh
sha256sums=('6e69b07af62da24aedab0706474fa51bcae9f2020589758ca46611806746c357')
