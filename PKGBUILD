# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=fselect
pkgver=0.3.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jhspetersson/fselect"
license=("MIT")

pkgdesc='Find files with SQL-like queries'

source=("$pkgver.tar.gz::https://github.com/jhspetersson/$pkgname/archive/$pkgver.tar.gz" "LICENSE::https://raw.githubusercontent.com/jhspetersson/fselect/master/LICENSE-MIT")
md5sums=('4ee39a330eaff9f42302400b60762516' 'b377b220f43d747efdec40d69fcaa69d')
makedepends=('rust')
depends=('gcc-libs')
build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    mkdir -pv "$pkgdir/usr/bin"
    mv "$pkgname-$pkgver/target/release/fselect" "$pkgdir/usr/bin"
    mkdir -pv "$pkgdir/usr/share/licenses/$pkgname"
    mv $(readlink "$srcdir/LICENSE") "$pkgdir/usr/share/licenses/$pkgname"
}