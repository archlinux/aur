# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Contributor: Sunny <brainworms2002 at gmail dot com>

pkgname="uzdoom-appimage"
pkgver=4.14.3
#_srctag=${pkgver%.*}-${pkgver##*.}
_srctag=${pkgver}
pkgrel=2
pkgdesc="UZDoom is a feature centric port for all Doom engine games, based on GZDoom, adding an advanced renderer and powerful scripting capabilities (Appimage)"
url="https://github.com/UZDoom/UZDoom"
license=("GPL-3.0-or-later" "BSD-3-Clause" "LGPL-3.0-or-later" "LicenseRef-DUMB" "bzip2-1.0.6" "0BSD" )
arch=("x86_64")
provides=("uzdoom")
conflicts=("uzdoom")
depends=(zlib glibc)
source=("https://github.com/UZDoom/UZDoom/releases/download/$_srctag/Linux-UZDoom-$_srctag.AppImage")
sha256sums=('7a0918ab951da5ffe873b7d479f701c09c216e0a23d821eef4548283ba43a167')
options=(!strip !debug)
build() {
  chmod +x "Linux-UZDoom-$_srctag.AppImage"
  "./Linux-UZDoom-$_srctag.AppImage" --appimage-extract
}

package() {
  install -Dm755 "Linux-UZDoom-$_srctag.AppImage" "$pkgdir/usr/bin/uzdoom"
    install -Dm644 "$srcdir/squashfs-root/org.zdoom.UZDoom.svg" -t "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "$srcdir/squashfs-root/org.zdoom.UZDoom.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/squashfs-root/usr/share/doc/uzdoom/licenses/"* -t "$pkgdir/usr/share/licenses/$pkgname/"
    rm -rf "$srcdir/squashfs-root/usr/share/doc/uzdoom/licenses/"
    install -Dm644 "$srcdir/squashfs-root/usr/share/doc/uzdoom/"* -t "$pkgdir/usr/share/doc/uzdoom"
    ln -s "/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/uzdoom/licenses"
    install -Dm644 "$srcdir/squashfs-root/usr/share/metainfo/"* -t "$pkgdir/usr/share/metainfo/uzdoom"
    install -Dm644 "$srcdir/squashfs-root/usr/share/mime/packages/org.zdoom.UZDoom-mime.xml" -t "$pkgdir/usr/share/mime/packages/"
    install -Dm644 "$srcdir/squashfs-root/usr/share/mime/application/x-doom-pk"{3,7}".xml" -t "$pkgdir/usr/share/mime/application/"
    install -Dm644 "$srcdir/squashfs-root/usr/share/mime/application/x-doom-wad.xml" -t "$pkgdir/usr/share/mime/application/"
}
