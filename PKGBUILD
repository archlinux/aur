# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=dreampotato-bin
_pkgname=DreamPotato
pkgver=0.3.1
pkgrel=1
pkgdesc='An emulator for the Dreamcast VMU'
url='https://github.com/RikkiGibson/DreamPotato'
arch=("x86_64")
license=("MIT")
makedepends=("fuse2")
source=(
    "$url/releases/download/v$pkgver/DreamPotato-Linux-x64-v$pkgver.zip"
)
sha256sums=(
    'bfd3e9e2252b0cbcb6a07647410d2c1e379eb3fdd9bced7d430a4a81ebff27ef'
)
provides=("dreampotato")
options=("!strip")

prepare() {
    cd $srcdir
    ./DreamPotato-linux-x64.AppImage --appimage-extract
}

package() {
    cd $srcdir

    install -Dm755 DreamPotato-linux-x64.AppImage $pkgdir/usr/bin/DreamPotato
    install -Dm644 squashfs-root/DreamPotato.desktop -t $pkgdir/usr/share/applications
    install -Dm644 squashfs-root/DreamPotato.png $pkgdir/usr/share/icons/hicolor/32x32/apps/DreamPotato.png
}
