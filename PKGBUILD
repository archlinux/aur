# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.2.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('3b95f86846733bcee097a1acfe65e62686df9b8f41d064c010debd2da3add754d521d52c074ec829e2b5a294b795108ace4094d288b294c574700ab768f85d40')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -j`nproc` --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
