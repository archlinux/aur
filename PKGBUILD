# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=shellshare
pkgver=2.0.5
pkgrel=1
pkgdesc='Share your terminal session in real-time'
arch=('x86_64')
url='https://shellshare.net/'
license=('Apache-2.0')
depends=('openssl')
makedepends=('cargo')
source=("https://github.com/vitorbaptista/shellshare/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4dd63f9ae2ffa53b39f0ecb98b35f42fe6553e037c8ecc47fe3cfd3e9ea0db8609bba9bb5fcccc35b12f83e93ed6c4b78ea9232b641d035f2151792e2f295912')
options=('!lto')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 target/release/shellshare -t "$pkgdir/usr/bin"
}
