# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.6.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('688099b35c5175c4c70df93ec318d3222bf3a588850baaa71711a0dba490ba015380f42291d2cd9d992d38fb6c5f10a385abd37efb574f581a46b90cdfa185fe')
options=(!debug)

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -j`nproc` --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
