# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-games
pkgver=1.17.3
pkgrel=1
pkgdesc='A rofi plugin which adds a mode to list available games for launch along with their box art'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-games'
license=('AGPL-3.0-only')
depends=('rofi' 'cairo' 'glibc' 'gcc-libs' 'glib2' 'sqlite')
makedepends=('rust' 'just')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8c25eec1fcd4240efe536f9bdc57637d9170b915e9b859002b86f2b3f6afcd64fe7d04e624cf8f33ed9f60869449709ed41d208d59e1abe303fb22e56888d2a6')
options=(!debug !lto)

prepare() {
    cd "$pkgname-$pkgver" || exit

    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver" || exit

    PKGDIR="$pkgdir" just build
}

package() {
    cd "$pkgname-$pkgver" || exit

    PKGDIR="$pkgdir" just install
}
