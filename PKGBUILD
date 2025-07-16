# Maintainer: Essem <smswessem@gmail.com>

pkgname=quantizr
pkgver=1.4.3
pkgrel=1
pkgdesc="Fast library for converting RGBA images to 8-bit palette images"
arch=('x86_64')
url="https://github.com/DarthSim/quantizr"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'cargo-c')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DarthSim/quantizr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83b471de2a2bb898f33bef5ab8514ae33b535f36a749ce79cdaa6d5a73558ae8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo cbuild --release --prefix=/usr
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo ctest --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo cinstall --destdir="$pkgdir" --prefix=/usr --release
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
