# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.3.4
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c8ab81ba9b101989c8c595c565e632e1fa65df2708b40222e5813f731f5d0895e61df7cecb24ca877ad371483dd5d862839128476da19f381b55f71dd58e2706')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -j`nproc` --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
