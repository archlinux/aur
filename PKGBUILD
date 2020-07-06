# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=scriptisto
pkgver=0.6.7
pkgrel=1
pkgdesc="A language-agnostic \"shebang interpreter\" that enables you to write scripts in compiled languages"
arch=('i686' 'x86_64')
url="https://github.com/igor-petruk/scriptisto"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6bd9ce557e67f266225151969de58b9f4156e31e6088caad8519fa1f0ddc6a96')

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
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
