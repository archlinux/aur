# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-games
pkgver=1.15.0
pkgrel=1
pkgdesc='A rofi plugin which adds a mode to list available games for launch along with their box art'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-games'
license=('AGPL v3.0')
depends=('rofi')
makedepends=('rust' 'just')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('84b2f7ef128f0ecd95d7d323e9ee081a1d80c3fa92e81779b865fe331d73e5f9e05f683aa31c98b52c56514f59a75d7321352a18f403b98abf816329ef5a37f6')
options=(!debug !lto)

prepare()
{
    cd "$pkgname-$pkgver" || exit

    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build()
{
    cd "$pkgname-$pkgver" || exit

    PKGDIR="$pkgdir" just build
}

package()
{
    cd "$pkgname-$pkgver" || exit

    PKGDIR="$pkgdir" just install
}
