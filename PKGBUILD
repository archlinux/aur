# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=dreampotato-bin
_pkgname=DreamPotato
pkgver=1.0.0
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
    '5a0923b5073bb2bd14b913139acba7395d452623d20ca540619e0c6ca9914830'
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
