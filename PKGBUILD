# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.6.4
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0564fa64910d6c1e43d6c50332729dbb614c5f547cec97fc14f179e62b5fab0835c7760799fc16964df4fb2ee9485404dfd78ddbc3512db373a7719c42c30d7c')
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
