# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-games
pkgver=1.19.0
pkgrel=1
pkgdesc='A rofi plugin which adds a mode to list available games for launch along with their box art'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-games'
license=('AGPL-3.0-only')
depends=('rofi' 'cairo' 'glibc' 'gcc-libs' 'glib2' 'sqlite')
makedepends=('rust' 'just')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7513f76df7d4f08c4876e826a55d2f08b9cd082253b0e8708da7e532298b7f0cc2a0d694fa4b561cb04d159741d56a4e9ac193bb653921980bdc3d4bab706170')
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
