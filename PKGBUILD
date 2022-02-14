# Maintainer: Martin Kröning (mkroening) <m.kroening@hotmail.de>

pkgname=edu-sync
pkgver=0.1.2
pkgrel=1
pkgdesc="A command line application for synchronizing the contents of Moodle instances to your computer."
arch=('x86_64')
url="http://edu-sync.org/"
license=('GPL3')
depends=('dbus')
makedepends=('cargo')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('18e19f5ca1874ee26d4dc08422cc4cf70d8bffbb0b8d88b4cf59b9971ba0a5ce')

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
