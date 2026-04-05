# Maintainer: 2bc4 <affett0@proton.me>

pkgname=twitch-hls-client
pkgver=1.6.2
pkgrel=1
pkgdesc='Minimal CLI client for watching Twitch streams'
url='https://github.com/2bc4/twitch-hls-client'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'clang')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/2bc4/twitch-hls-client/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ba08ddd702327bfbae69334522a9734e0b56d92befbe05eef523f080da6b9847')

prepare() {
    cd "$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target cargo fetch --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    CC=clang RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target cargo build --release --offline
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
    install -Dm0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
