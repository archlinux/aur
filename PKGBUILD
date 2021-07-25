# Maintainer: Martin Kröning (mkroening) <m.kroening@hotmail.de>

pkgname=edu-sync
pkgver=0.1.1
pkgrel=2
pkgdesc="A command line application for synchronizing the contents of Moodle instances to your computer."
arch=('x86_64')
url="http://edu-sync.org/"
license=('GPL3')
depends=('dbus')
makedepends=('cargo')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('132e8bf52db144b1fe60c9913c412ac0c3dc0152d1477d1602af62f5671476bd')

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
