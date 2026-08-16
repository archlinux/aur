# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-games
pkgver=1.18.0
pkgrel=1
pkgdesc='A rofi plugin which adds a mode to list available games for launch along with their box art'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-games'
license=('AGPL-3.0-only')
depends=('rofi' 'cairo' 'glibc' 'gcc-libs' 'glib2' 'sqlite')
makedepends=('rust' 'just')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('00e8493ed911e9b604bb82b2b1398f25d23d33d484ed50de64948896d1b617a744c668c181c737995258d7080a07d7bc44d9a09c368de4cc28b5f93478cbbb30')
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
