# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.3.3
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f465b84c374bdf7fa2f06851accd1b91e9df3651cae097f50338aecec2c8d2121c27e8694f6848140a34e8a7a7f16a7bf77bddba9ea08027c578ac378f1cad37')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -j`nproc` --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
