# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=emulsion
pkgver=3.0.0
pkgrel=1
pkgdesc="A fast and minimalistic image viewer"
arch=('i686' 'x86_64')
url="https://github.com/ArturKovacs/emulsion"
license=('MIT')
depends=('gcc-libs' 'hicolor-icon-theme')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver%.*}.tar.gz"
        "emulsion.desktop")
sha256sums=('9564d03f65d24a09438cd7af523277370e978619074055a3371a3d0943dd40eb'
            '7003f0a26dec380e22b2f0fedd044e266663f5a49e2557d6e4dc738933561e40')

build() {
    cd $pkgname-${pkgver%.*}
    cargo build --release --locked --no-default-features
}

package() {
    install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"

    cd $pkgname-${pkgver%.*}
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 resource_dev/emulsion.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
