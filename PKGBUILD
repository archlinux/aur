# Maintainer: Yuki.N <Syukkic@gmail.com>
pkgname=lonefire
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool downloading artworks which format is PNG/JPG format on pixiv"
arch=('x86_64')
url="https://github.com/Syukkic/lonefire"
license=('GPL-3.0-only')
depends=('glibc' 'openssl' 'gcc-libs')
makedepends=('rustup' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Syukkic/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52c929f8c035da78b680f78d14a8c298cb6d8538fa3104ee2b96549c0ad03aeb')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked --all-features
}


package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
