# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino
pkgver=0.1.4
pkgrel=4
arch=('i686' 'x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")

pkgdesc='Batch rename utility for developers'

source=("$pkgver.tar.gz::https://github.com/yaa110/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f6a7201ac5469e421845f091b88f6c071eb1c7791c5fd2692924a19204084d56312160f98f8e34a20aa1a4ff125ef822d8ab68ed336885cce0855c3921b87bea')
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

