# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=motrix-bin
pkgver=1.4.1
pkgrel=2
pkgdesc="elegent downloading tool frontend for aria2c, using vue (binary version)"
arch=('x86_64')
url="https://motrix.app/"
license=('MIT')
conflicts=(
    'motrix'
    'motrix-git'
)
makedepends=(
    'p7zip'
)
depends=(
    'gtk3'
    'nss'
    'libxss'
)
source=(
    "https://dl.motrix.app/release/Motrix-$pkgver-x86_64.AppImage"
)
sha512sums=(
    '1e3e1cd053453f4bd4440729ec6f95e91e6da3ceafe801cab800b1ae157c89dd50be818e44fb7a6685ca7826dfb530dc698f51cfc0015892a0893fc2abc2c15f'
)

package() {
    7z x "Motrix-$pkgver-x86_64.AppImage" -o"$pkgdir/opt/Motrix/"

    chmod -R 755 "$pkgdir/opt/"

    mkdir -p "$pkgdir/usr"
    mv "$pkgdir/opt/Motrix/usr/share" "$pkgdir/usr/share"

    sed -i 's/Exec=AppRun/Exec=\/opt\/Motrix\/motrix/' "$pkgdir/opt/Motrix/motrix.desktop"
    install -Dm644 "$pkgdir/opt/Motrix/motrix.desktop" "$pkgdir/usr/share/applications/motrix.desktop"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/Motrix/motrix "$pkgdir/usr/bin/motrix"

    rm "$pkgdir/opt/Motrix/AppRun"
    rm "$pkgdir/opt/Motrix/motrix.png"
    rm "$pkgdir/opt/Motrix/motrix.desktop"
}
