# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=emulsion
pkgver=9.0.0
pkgrel=1
pkgdesc="A fast and minimalistic image viewer"
arch=('i686' 'x86_64')
url="https://github.com/ArturKovacs/emulsion"
license=('MIT')
depends=('gcc-libs' 'hicolor-icon-theme')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver%.*}.tar.gz"
        "emulsion.desktop")
sha256sums=('457d4a44db236c5415a4007ddf7b06575a50124885cf7c7c0bec928bdad61155'
            '0ddafdb9abec4887cab3e211f216e5c7e0f69bb15cd5426a6b85e469aeafd0aa')

build() {
    cd $pkgname-${pkgver%.*}
    cargo build --release --locked
}

check() {
    cd $pkgname-${pkgver%.*}
    cargo test --release --locked
}

package() {
    install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"

    cd $pkgname-${pkgver%.*}
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 resource_dev/emulsion.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
