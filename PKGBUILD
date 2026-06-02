# Maintainer: George Oastler <goastler4 at gmail dot com>
# SPDX-License-Identifier: 0BSD
pkgname=snortal
pkgver=1.0.6
pkgrel=1
pkgdesc='Detect captive portal URLs on a Linux network'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/goastler/snortal'
license=('AGPL-3.0-or-later')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/goastler/snortal/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('988730a0d87a75b0e6810029e341a2577a0f1d4e80408333c4555902fceecd1e')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
