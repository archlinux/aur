# Maintainer: Cyb3rKo <cyb3rko-aur [ät] pm [dot] me>

pkgname=termirs
pkgver=0.2.12
pkgrel=1
pkgdesc="A modern, async SSH terminal client"
url="https://github.com/caelansar/termirs"
license=(MIT)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('391c90dd34b3202af999a44708a11073aa5624713a3bcf81fcf419cfad8c0d08')
sha512sums=('27cb25524c43558a020d6e811a7eb3b54fcc19360b19d4b46f448e0e0418481e71e656da1efff3287a42c8414b0f83c51def88043ad47385835186c1e0cce8d0')
b2sums=('b99166a4bd95975efb4c946d7b4d5397873bbf541e4ba888ee6300d62147869d9fd8908632d8ceba390c4915bdbf50c9bee580bd534e5861d58ad0494a14c9ff')
arch=(x86_64)
makedepends=(git cargo)
provides=("termirs=$pkgver")
conflicts=(termirs)
options=(!debug !lto)

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/termirs"
}
