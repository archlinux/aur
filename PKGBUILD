# Maintainer: username227 <gfrank227 at gmail dot com> 

pkgname="suyu-appimage"
pkgver=0.0.3
pkgrel=1
epoch=1
pkgdesc="suyu is the afterlife the world's most popular, open-source, Nintendo Switch emulator (appimage version)"
url="https://git.suyu.dev/suyu/suyu"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("suyu")
conflicts=('suyu-git' 'suyu-dev-git' 'suyu-dev-qt6-git')
replaces=()
depends=("ffmpeg"
         "fuse2")
source=(suyu.AppImage::"https://git.suyu.dev/suyu/suyu/releases/download/v$pkgver/Suyu-Linux_x86_64.AppImage")
b2sums=('fdaf511bfbcef9d73fcb6a36149df06355ff111df8a6302ca48645fd34e568e3db37f54d367422780596fe6742ced269e60aca4916c0131e6c5b7c33722404e7')
options=("!strip")

prepare() {
cd $srcdir
chmod +x suyu.AppImage
./suyu.AppImage --appimage-extract
}

package(){
 install -D -m 755 "$srcdir/suyu.AppImage" "$pkgdir/usr/bin/suyu"
 install -D -m 755 "$srcdir/squashfs-root/usr/share/applications/dev.suyu_emu.suyu.desktop" -t "$pkgdir/usr/share/applications"
 install -D -m 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/scalable/apps/dev.suyu_emu.suyu.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}

