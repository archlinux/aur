# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=0.3.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")

pkgdesc='Batch rename utility for developers'

source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c4cae831d3245494e4b3b206d66f076458ef9525919c39468b910ef2a259089ac62e7aad33cc94575124da08bc79735d511569195cccf134d126bf037b5e6f1a')
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

