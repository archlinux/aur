# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.3.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f5133d6332868fc713a6b50a25e4da85e814585cede61b3ca4f5c2b2676f1a9a8d0a202c7a421c825a626e20b98a929b7096fe07da05e3bdac393a70adf8a3ba')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -j`nproc` --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
