# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-games
pkgver=1.17.5
pkgrel=1
pkgdesc='A rofi plugin which adds a mode to list available games for launch along with their box art'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-games'
license=('AGPL-3.0-only')
depends=('rofi' 'cairo' 'glibc' 'gcc-libs' 'glib2' 'sqlite')
makedepends=('rust' 'just')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fca1bc3c2e8f4e87158ef461f811dacb0684965f74bf0867e6322b2ff23de0eaa8c7252357ac59b1457d0fa2722e56d9e016bea7d32f9f917831ceb7027cfdd7')
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
