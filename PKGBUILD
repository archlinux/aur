# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=scribl
pkgver=0.3.1
pkgrel=1
pkgdesc='make simple instructional videos'
arch=('x86_64')
url="https://github.com/jneem/$pkgname"
license=('Apache')
depends=('gst-plugins-base-libs' 'gtk3')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e3fdd0dcc3f358528a7343babb23169718121e357a08ce16e079de08fea774e1')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --all-features
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
