# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.3.2
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2afa2c7d2be1d96d62eb80b06b4699dcd181aae786fbf895d9fbd6f38d7f52e306f9a75f848c3766c871c3e40ff25dae65f592378918cbd7a30061b437d0ccb4')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -j`nproc` --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
