# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lite
pkgver=1.08
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=('any')
url="https://github.com/rxi/$pkgname"
license=('MIT')
makedepends=('sdl2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-path-fix.patch")
sha256sums=('e89dba314e437c9bf129bcf4ef631d6db8810db18f382048987d3a0a944d804b'
            'a874de709bf2201816f96807aa50f6b1a15a19aa7989084f01422dd5fe488055')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir/$pkgname-path-fix.patch"
}

build() {
    cd "$pkgname-$pkgver"
    ./build.sh
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" $pkgname
    install -d "$pkgdir/usr/share/$pkgname"
    cp -a data/* "$pkgdir/usr/share/$pkgname/"
}
