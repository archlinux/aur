# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>

pkgname=swaylockd
pkgver=0.1.0
pkgrel=1
pkgdesc="A dumb launcher to spawn swaylock and ensure it runs no matter what"
url="https://github.com/jirutka/swaylockd"
arch=("x86_64")
license=("MIT")
depends=("swaylock")
makedepends=("asciidoctor")
source=("https://github.com/jirutka/swaylockd/archive/v$pkgver/swaylockd-$pkgver.tar.gz")
sha512sums=("8ac850d4d5ceb32cc62a213eba1cdad14b51f6f957cffea82c64853f5e347a3ddcfbd66fa021e1a90714d10042d586e1929161f3606a5d55dcb0bb1d28494e59")

build() {
    cd "$pkgname-$pkgver"
    make
    asciidoctor ./README.adoc
}

check() {
    cd "$pkgname-$pkgver"
    XDG_RUNTIME_DIR="$srcdir" ./build/swaylockd --version
}

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" prefix=/usr
    install -Dm 644 ./README.html -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 ./LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
