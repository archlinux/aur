# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.2.1
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('522d549c49b98fa84e18130c242615a282dd57a112414fc4172d08f6261ad2b675a4f2c82368dae3a2f978363dac6044f9e5d9fef1d7db75d2066b9e36104fd3')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -j`nproc` --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
