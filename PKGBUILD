# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.3.7
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('490743de3f0b4aef851ae799af3ad1d202354088a4bdf7b8d45efd8002afaf03993bb2520823fe3efe37d6ad9e19202236388874844d954094936f96a5807dcc')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -j`nproc` --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
