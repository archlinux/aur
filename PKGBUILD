# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=scribl
pkgver=0.2.5
pkgrel=1
pkgdesc='make simple instructional videos'
arch=('x86_64')
url="https://github.com/jneem/$pkgname"
license=('Apache')
depends=('gst-plugins-base-libs' 'gtk3')
makedepends=('cargo' 'rust')
_prefix=flatpak-v
source=("$url/archive/$_prefix$pkgver.tar.gz")
sha256sums=('245eb6892517f088577c2f60a8d6de753ddf45f76e60e3a02c9ba62e3087451c')

prepare() {
    cd "$pkgname-$_prefix$pkgver"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$_prefix$pkgver"
    cargo build --release --locked --all-features
}

check() {
    cd "$pkgname-$_prefix$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$_prefix$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
