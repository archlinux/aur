# Maintainer: Martin Kröning (mkroening) <m.kroening@hotmail.de>
# Co-Maintainer Jonas Wunderlich <aur[at]03j[dot]de>

pkgname=edu-sync
pkgver=0.3.2
pkgrel=1
pkgdesc="A command line application for synchronizing the contents of Moodle instances to your computer."
arch=('x86_64')
url="http://edu-sync.org/"
license=('GPL3')
depends=()
makedepends=('cargo')
options=(!strip !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c5b508ab7f78dafd717a3a5e18b9649f5b0fdab57a857c94cc498d0b135b178')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked
}

build() {
    cd $pkgname-$pkgver
    cargo build --release --frozen
}

check() {
    cd $pkgname-$pkgver
    cargo test --release --frozen
}

package() {
    cd $pkgname-$pkgver
    install -Dm 755 target/release/$pkgname-cli -t "$pkgdir/usr/bin"
}
