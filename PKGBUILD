# Maintainer: 2bc4 <affett0@proton.me>

pkgname=twitch-hls-client
pkgver=1.7.0
pkgrel=1
pkgdesc='Minimal CLI client for watching Twitch streams'
url='https://github.com/2bc4/twitch-hls-client'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'clang')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/2bc4/twitch-hls-client/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('36ff51aa9d983aa8765d6d0eb8a4898ce92efecbd66d37e140dcf485e43bdcf2')

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
