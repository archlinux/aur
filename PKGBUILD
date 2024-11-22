# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.3.6
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('526b4ceae6c375d37b45b054fb25129ab6fb0f208953d2d1bdac9d0e5087023f1ef9c781888e674f1f79562501f85a610c4a81b3f8095a67d4d5b482a165bb6e')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -j`nproc` --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
