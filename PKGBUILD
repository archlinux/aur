# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-games
pkgver=1.17.4
pkgrel=1
pkgdesc='A rofi plugin which adds a mode to list available games for launch along with their box art'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-games'
license=('AGPL-3.0-only')
depends=('rofi' 'cairo' 'glibc' 'gcc-libs' 'glib2' 'sqlite')
makedepends=('rust' 'just')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6090526a0a7af491d2bfbdeb9d07081ad9286cedb8d508b8dfd053ab487a72e569c1beb750284dc17e1a74838ce77e2ec6c2387ad361c2504803f54ad9593490')
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
