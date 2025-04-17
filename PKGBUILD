# Maintainer: Nick Webster <nick@nick.geek.nz>
pkgname=micropad
pkgver=4.5.2
pkgrel=1
pkgdesc="A powerful note-taking app that helps you organise + take notes without restrictions."
arch=('x86_64')
url="https://getmicropad.com"
license=('MPL2')
depends=(
    'electron31'
)
source=(
    "https://github.com/MicroPad/MicroPad-Electron/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman"
    "micropad-bin"
)
sha256sums=('b8f2adbf47b1fc3f0f987fbcd98626a529c289c2d3bad6b8b7b248a6b5ab7c9f'
            '7ab508fb119862f930f571cde97a7ad02862f8a7b8720dd306d1a89703db2949')
install="micropad.install"

package() {
    install -dm755 "$pkgdir/opt/µPad"
    cp -a opt/µPad/resources "$pkgdir/opt/µPad/"
    cp -a usr "$pkgdir/usr"

    # Use system electron
    install -Dm755 "$pkgname-bin" "$pkgdir/opt/µPad/$pkgname"

    # Link to the binary
    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/µPad/micropad "$pkgdir/usr/bin/$pkgname"
}
