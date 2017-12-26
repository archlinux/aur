# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=emulationstation
_gitname=EmulationStation
pkgver=2.6.2
pkgrel=2
pkgdesc="Emulation Station is a flexible emulator front-end supporting keyboardless navigation and custom system themes."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/RetroPie/EmulationStation"
license=('MIT')
install=emulationstation.install
depends=('vlc' 'alsa-lib' 'sdl2' 'boost-libs' 'freeimage' 'curl')
makedepends=('cmake' 'boost' 'freetype2' 'eigen' 'curl' 'git')
optdepends=('ttf-droid: Fallback fonts for Chinese/Japanese/Korean characters'
            'dolphin-emu: GameCube and Wii support'
            'mupen64plus: Nintendo 64 support'
            'mednafen: NES and GBA support'
            'zsnes: SNES support'
            'stella: Atari 2600 support'
            'ppsspp-headless: PSP support'
            'steam: Steam support')
conflicts=(emulationstation-git)
source=("https://github.com/RetroPie/$_gitname/archive/v$pkgver.tar.gz"
        "emulationstation.desktop"
        "emulationstation.png")
sha256sums=('9f255e3426fed249ef5809be7b9236b7d6b603653b37fe39612bdf2eac343cbe'
            '5564803e0a82e132ab507b9cd341b32d1ce5b8be527996fbe13607d90f1dde2c'
            'ac589d9da5c258226f8de76e99afe2b07ac86030ced90d284d31b51193057f9c')

prepare() {
        cd "$_gitname-$pkgver"
        rm -rf external/pugixml
        git clone https://github.com/zeux/pugixml.git external/pugixml
}

build() {
        cd "$_gitname-$pkgver"
        cmake .
        make
}

package() {
        install -Dm755 "$srcdir/$_gitname-$pkgver/emulationstation" "$pkgdir/usr/bin/emulationstation"
        install -Dm644 "$srcdir/$_gitname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/emulationstation/LICENSE"
        install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
        install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
