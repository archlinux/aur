# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.4.6
pkgrel=0
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
provides=('bottom')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/archive/$pkgver.tar.gz")
license=('MIT')
sha512sums=('1aeccd5225eeb6d640df30f47798ee7cb7a8a27daac6dcf7cf9b85eefae33774b5c4718c8e46b678089d996e09810f4b3baae60587a3acc07fe91c22cec3fd38')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

check() {
    cd $pkgname-$pkgver
    cargo test --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/btm "$pkgdir/usr/bin/btm"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}