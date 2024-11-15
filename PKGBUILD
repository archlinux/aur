# Maintainer: Martin Kröning (mkroening) <m.kroening@hotmail.de>
# Co-Maintainer Jonas Wunderlich <aur[at]03j[dot]de>

pkgname=edu-sync
pkgver=0.2.3
pkgrel=1
pkgdesc="A command line application for synchronizing the contents of Moodle instances to your computer."
arch=('x86_64')
url="http://edu-sync.org/"
license=('GPL3')
depends=()
makedepends=('cargo')
options=(!strip !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ffa93c45060b208e7fce5e1355025d2f0b761f1044a1825cbf69373feb0c9dc1')

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
