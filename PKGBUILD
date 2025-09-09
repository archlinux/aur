# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-games
pkgver=1.13.0
pkgrel=1
pkgdesc='A rofi plugin which adds a mode to list available games for launch along with their box art'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-games'
license=('AGPL v3.0')
depends=('rofi')
makedepends=('rust' 'just')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('533e5e545a781230958cb4506f1e6a6602d787485dab43c534997bb4e8523335394b2bc3a3fe6520dd3e7a284f5aa4b477a82572bc05e80bc3a0c81416f0b064')
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
