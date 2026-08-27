# Maintainer: elgatolinux <gato.mega.mp3@gmial.com>
pkgname=catpaper-git
pkgver=r3.4650e4f
pkgrel=1
pkgdesc="Selector de wallpapers standalone (Qt6 QML) con paleta pywal y overlay layer-shell"
arch=('x86_64')
url="https://github.com/elgatolinux/catpaper"
license=('GPL-3.0-or-later')
depends=('qt6-base'
         'qt6-declarative'
         'qt6-multimedia'
         'qt6-multimedia-ffmpeg'
         'qt6-wayland'
         'qt6-imageformats'
         'layer-shell-qt'
         'python-pywal')
makedepends=('cmake' 'ninja' 'git')
optdepends=('awww: transiciones y multi-monitor (AUR)'
            'swww: transiciones y multi-monitor (alternativa)'
            'swaybg: setter de wallpapers (wayland)'
            'feh: setter de wallpapers (X11)'
            'nitrogen: setter de wallpapers (X11)'
            'mpvpaper: wallpapers de video'
            'ffmpeg: thumbs de videos'
            'ttf-jetbrains-mono: fuente de la UI')
provides=('catpaper')
conflicts=('catpaper')
source=("catpaper::git+https://github.com/elgatolinux/catpaper.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/catpaper"
    printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/catpaper"
    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/catpaper"
    cmake --install build --prefix "$pkgdir/usr"
    install -Dm644 catpaper.desktop "$pkgdir/usr/share/applications/catpaper.desktop"
}
