# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=scriptisto
pkgver=0.6.10
pkgrel=1
pkgdesc="A language-agnostic \"shebang interpreter\" that enables you to write scripts in compiled languages"
arch=('i686' 'x86_64')
url="https://github.com/igor-petruk/scriptisto"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a1b55fb99e054b7693f559df50c078fb4b55125d59076189c8001fd421386f16')

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
