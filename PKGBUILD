# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-games
pkgver=1.14.0
pkgrel=1
pkgdesc='A rofi plugin which adds a mode to list available games for launch along with their box art'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-games'
license=('AGPL v3.0')
depends=('rofi')
makedepends=('rust' 'just')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6cd1774f9efd5604886ba772c9992be23ac8ec2ac8c23d1ff3a26a294c482f87471dab85227edeb8e5030517f09d47d36e4adf32a94473932f07525f0c2a3132')
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
