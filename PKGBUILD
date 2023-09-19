# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: Benjamin L. Merritt <blm768@gmail.com>

pkgname=lectrote-bin
pkgver=1.4.5
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
sha256sums=('64d38de080f417bd16965cb5a51edf6a9022da8b209c28f66ff05a71c125e5a3'
            'facacc25f091eec64a619c52423231785ebfb911d954229faeea3676acda21fe'
            'b47e65391b0cca22d023fabd3e74d403cd30d8e99ef8be0b0107db283b74b484')

package() {
    install -Dm644 lectrote.desktop "$pkgdir/usr/share/applications/lectrote.desktop"
    install -Dm755 lectrote "$pkgdir/usr/bin/lectrote"

    cd Lectrote-linux-x64
    sed -i "s/(path_mod\.basename(path) == 'main\.js' || path_mod\.basename(path) == '\.')/(path_mod.basename(path) == 'main.js' || path_mod.basename(path) == '.' || path_mod.basename(path) == 'electron' || path_mod.basename(path) == 'lectrote')/" resources/app/main.js
    sed -i "0,/game_for_webcontents(ev\.sender)/s//game_for_webcontents(win.webContents)/" resources/app/main.js
    sed -i "0,/game_for_webcontents(ev\.sender)/s//game_for_webcontents(win.webContents)/" resources/app/main.js
    install -d "$pkgdir/usr/share/lectrote"
    cp -r resources/app/* "$pkgdir/usr/share/lectrote/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

