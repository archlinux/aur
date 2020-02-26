# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.2.2
pkgrel=1
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/releases/download/$pkgver/bottom_source_code.tar.gz")
license=('MIT')
sha512sums=('94fffc17fbcdfd4c2360a15f57c14baf5043921b87aab9fae477c0ba9a4f67bc0c617e7e3b146aec1382a19fec0697b7854f9b195f30115bc86d8e2f2d47c241')

build() {
    cargo build --release
}

package() {
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    cd "./target/release"
    strip btm
    install -Dm755 btm "$pkgdir/usr/bin/btm"
}