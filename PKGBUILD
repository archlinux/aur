# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom
pkgver=0.2.2
pkgrel=2
pkgdesc="A cross-platform graphical process/system monitor with a customizable interface and a multitude of features."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/releases/download/$pkgver/bottom_source_code.tar.gz")
license=('MIT')
sha512sums=('f857d54f8c6dd563718ecb260a0f020f24e3f90701f984f61e9bd726a20f4f05302446eed95d14faa860c566f3541e5246d1f96431a5e00b46712964ac29201a')

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