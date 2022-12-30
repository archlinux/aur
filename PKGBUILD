# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.3.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('66bf6b35c556e18a3f524ee5ad1b97381b650f56d0108d5ca71a5d4805bcf1b4f4e1cfc7a56024eb0c19d02ab1dddac28279fb28cff34f4eeb1cf9735fa4ff4b')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -j`nproc` --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
