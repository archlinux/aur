# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=0.4.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")

pkgdesc='Batch rename utility for developers'

source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0cbd952c806aff825c301617c7ee091ee33202eab525aeee02abd199db15f5f9c8b557a4fe8ae3fc68ff20ffbc7e49ebe040f153603b30d6867957e9a6024c66')
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

