# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: Benjamin L. Merritt <blm768@gmail.com>
pkgname=lectrote-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="The IF interpreter in an Electron shell"
arch=('x86_64')
url="https://github.com/erkyrath/lectrote"
license=('MIT')
depends=('electron' 'alsa-lib' 'gconf' 'gtk2' 'libxtst' 'libxss' 'nss')
makedepends=()
provides=('lectrote')
install=lectrote.install
source=(
    "https://github.com/erkyrath/lectrote/releases/download/lectrote-$pkgver/Lectrote-$pkgver-linux-x64.zip"
    "lectrote.desktop"
    "lectrote"
)
sha256sums=('d5f39f6e288a8c9c0f781d6bfc71ebef53f7c847b2f05c679bae35384e058376'
            '2d2440025aad945a2186c9f49f9d57ab0c5c41f1a232b76d0e402544335af3a8'
            'b47e65391b0cca22d023fabd3e74d403cd30d8e99ef8be0b0107db283b74b484')

package() {
    install -Dm644 lectrote.desktop "$pkgdir/usr/share/applications/lectrote.desktop"
    install -Dm755 lectrote "$pkgdir/usr/bin/lectrote"

    cd Lectrote-linux-x64
    sed -i "s/(path_mod\.basename(path) == 'main\.js' || path_mod\.basename(path) == '\.')/(path_mod.basename(path) == 'main.js' || path_mod.basename(path) == '.' || path_mod.basename(path) == 'lectrote')/" resources/app/main.js
    install -d "$pkgdir/usr/share/lectrote"
    cp -r resources/app/* "$pkgdir/usr/share/lectrote/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

