# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=hurrycurry-client
pkgver=1.3.0
pkgrel=1
pkgdesc="A game about cooking (client)"
arch=('any')
url="https://codeberg.org/hurrycurry/hurrycurry"
license=('AGPL3')
depends=('godot')
makedepends=('godot')
source=("hurrycurry-$pkgver.tar.gz::https://codeberg.org/hurrycurry/hurrycurry/archive/v$pkgver.tar.gz"
        "hurrycurry-client"
        "hurrycurry-client.desktop")
sha256sums=('4852c4e313fa921cc8216219956c877f1d1983e9b3a10f72608d2c45ab46743e'
            '2853345b64837352f576397aac7659aa0306e03ca7de4cdd04bb64bab9c8706c'
            '2607233a774b1f74f10deb0ef1c594e418554c4b5701d0e700016368e6d59718')

build() {
    cd "hurrycurry"
    make client
    mkdir -p target/release
    godot --headless --export-pack $CHOST ../target/release/client.pck client/project.godot
}
package() {
    install -Dm755 hurrycurry-client "$pkgdir/usr/bin/hurrycurry-client"
    install -Dm644 hurrycurry-client.desktop "$pkgdir/usr/share/applications/hurrycurry-client.desktop"
    install -Dm644 hurrycurry/target/release/client.pck "$pkgdir/usr/share/hurrycurry/client.pck"
    install -Dm644 hurrycurry/COPYING "$pkgdir/usr/share/licenses/hurrycurry-client/COPYING"
    install -Dm644 hurrycurry/client/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/hurrycurry.png"
}
