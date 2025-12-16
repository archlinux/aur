# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=rusticon
pkgver=0.2.2
pkgrel=1
pkgdesc='A mouse driven SVG favicon editor for your terminal'
arch=('armv7h' 'aarch64' 'i686' 'riscv64' 'x86_64')
url='https://github.com/ronilan/rusticon'
license=('CC-BY-NC-ND-4.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ronilan/rusticon/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b001cdcdbfc33559e1a024590087847db944041c901e3a59f855eb3021f1b4a8a215837f3f91e1f8291542a6caabaecab6502c5a8353500417397a2b9f7638cc')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/rusticon "$pkgdir/usr/bin/rusticon"
}
