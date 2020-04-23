# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=0.4.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")

pkgdesc='Batch rename utility for developers'

source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('6a074b7f29120f7cc60ec1fe1b5810b3cb17386f5a5fa569039b086c3704b8e3734ac7f455380cfb5ee1b506be0e692523c3b2dfd97b20f87a4f41e8d085f2c8')
makedepends=('rust' 'python3')
depends=('gcc-libs')
conflicts=('nomino-bin')
provides=('nomino')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    RUSTFLAGS='-C link-args=-s' cargo build -j`nproc` --release
}

package() {
    install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

