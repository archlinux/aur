# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=cicada-shell
_pkgname=cicada
pkgver=0.9.22
pkgrel=1
pkgdesc="A bash-like Unix shell written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/mitnk/cicada"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
provides=('cicada')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1d8163764dd94f76e857e39ac22dcd1e44133593f8bc225d5b57a84f8f809994')

build() {
    cd $_pkgname-$pkgver
    cargo build --release
}

package() {
    cd $_pkgname-$pkgver
    install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    find docs/ -type f -exec install -Dm644 "{}" -t "$pkgdir/usr/share/doc/$pkgname" \;
}
