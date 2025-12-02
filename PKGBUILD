# Maintainer: Spoorloos <mick.negenman@icloud.com>

_version='1.1.3'
_appimage='iloader-linux-amd64.AppImage'
_checksum='8c7248bb696a2898c6e13beff8bf643636b3762b85276ad5d2326fc35746ee26'

pkgbase='iloader'
pkgname='iloader-appimage'
pkgver=$_version
pkgrel=2
pkgdesc='User-friendly sideloader'
url='https://github.com/nab138/iloader'
arch=('x86_64')
license=('MIT')
source=("https://github.com/nab138/iloader/releases/download/v$_version/$_appimage")
sha256sums=($_checksum)
noextract=($_appimage)
options=(!strip !debug)

prepare() {
    chmod +x "$srcdir/$_appimage"

    "$srcdir/$_appimage" --appimage-extract
}

build() {
    sed -i \
        -e "s|Exec=.*|Exec=/usr/bin/iloader|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/hicolor/256x256/apps/iloader.png|" \
        "$srcdir/squashfs-root/iloader.desktop"
}

package() {
    install -Dm755 "$srcdir/$_appimage" "$pkgdir/usr/bin/iloader"
    install -Dm644 "$srcdir/squashfs-root/iloader.desktop" "$pkgdir/usr/share/applications/iloader.desktop"
    install -Dm644 "$srcdir/squashfs-root/iloader.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/iloader.png"
}
