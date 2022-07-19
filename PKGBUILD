# Maintainer: Yo'av Moshe <archlinux@yoavmoshe.com>
pkgname=pidif
pkgver=0.1
pkgrel=0
pkgdesc="Simple PDF Reader"
url="https://github.com/bjesus/pidif"
arch=("any")
license=("GPL")
makedepends=(cargo gtk4 poppler cairo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bjesus/pidif/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("ba067c8c98cc5db6c3412dd7793ba901863f9ca6fa2cf828d28597c87614c3ba7f57e74d7ba85267e28c569d30e3ab12424eae96e963092d5bfb6fd720d40ca9")

prepare() {
    mv $pkgname-$pkgver/* .
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

