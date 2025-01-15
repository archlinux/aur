# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=1.5.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")
pkgdesc='Batch rename utility for developers'
makedepends=('cargo')
depends=('gcc-libs')
provides=('nomino')
source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c1510c5f2347b178e8dfdf2e6509f5133a6651b5adb9a376bf6faa7bde4a43a1e375a013c4c1f6274375d8d8400d2d95ebdc61647b2eadeb828cb7a5b436632e')
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
