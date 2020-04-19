# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=0.2.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")

pkgdesc='Batch rename utility for developers'

source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('9c23fdf04ce2862c83b8e51b35b314c7a415e31d55004ff8f92ef1e8779002afa676178ce74de7584df54ded64b936a57bd3a17825d034ca556c921c8eb157b1')
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

