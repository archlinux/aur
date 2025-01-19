# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.6.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('3efa920de023d0a26ade49c136cf83fc32ddbf30fa4315c6f35ca0e23dbc6f075df463f356624574423b8f8f5e7d7049b3a16a85520745cb16b23b36bfc4b143')
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
