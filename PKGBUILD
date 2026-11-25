# Maintainer: Evilchuck666 <carlos.martinez.medina1992@gmail.com>
#
# Repackages the single-file Linux build attached to each GitHub release. A build from
# source isn't practical: ArenaHub runs on Python 3.13 and needs steam-next, which Arch
# doesn't package. The release workflow copies this file to the AUR with pkgrel=1 and
# fills in the checksums with updpkgsums.
pkgname=arenahub-bin
_pkgname=ArenaHub
pkgver=0.4.1
pkgrel=1
pkgdesc="Installer and launcher for Quake III Arena, Team Arena and classic mods"
arch=('x86_64')
url="https://github.com/Evilchuck666/ArenaHub"
license=('GPL-3.0-only')
# glibc of the Ubuntu 24.04 build machine; Qt's xcb and wayland platform libraries;
# SDL2 for the Quake3e engine.
depends=('glibc>=2.39' 'gcc-libs' 'zlib' 'fontconfig' 'freetype2' 'libglvnd'
         'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'xcb-util-cursor'
         'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm'
         'wayland' 'dbus' 'sdl2' 'hicolor-icon-theme')
optdepends=('vulkan-icd-loader: Vulkan renderer')
provides=("arenahub=$pkgver")
conflicts=('arenahub')
# Stripping would break the executable: PyInstaller appends its archive to it.
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-linux-x64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x64.tar.gz"
        "arenahub-$pkgver.svg::https://raw.githubusercontent.com/Evilchuck666/$_pkgname/v$pkgver/assets/icons/arenahub.svg"
        'arenahub.desktop')
sha256sums=('43c951ada8bd0afdfe6567e2a4e2ac67dd1a0fb3f8c64efedaaeac7828b20818'
            '442267b4dcc8fda76ade20e912d8563da4c811e864ba197ea171f097ebb21da5'
            '05e21ea59cedf7d789557cad4b83251056896495bb0159b082b115776929eab8')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/arenahub"
    install -Dm644 "$srcdir/arenahub.desktop" "$pkgdir/usr/share/applications/arenahub.desktop"
    install -Dm644 "$srcdir/arenahub-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/arenahub.svg"
}
