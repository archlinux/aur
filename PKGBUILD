# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="citra-appimage"
# to update:
#       1. reset $pkgrel to 1
#       2. go to https://github.com/citra-emu/citra-nightly/releases
#       3. copy release to $pkgver
#       4. copy date-commit to $_ref
_ref=20230927-6cfb8e0
pkgver=1997
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger, GUI version, already compiled"
url="https://citra-emu.org"
license=("GPL2")
arch=("x86_64")
provides=("citra")
# my old + other previous packages
conflicts=("citra-bin"
           "citra-git"
           "citra-canary-bin"
           "citra-canary-git"
           "citra-qt-git"
           "citra-qt-canary-bin"
           "citra-qt-bin")
# my old packages
replaces=("citra-bin"
          "citra-qt-bin")
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/citra-emu/citra-nightly/releases/download/nightly-$pkgver/citra-linux-appimage-$_ref.tar.gz"
        "citra.desktop")
b2sums=('311fc393dd8301143ff751460f52b28e08a68bb3ec976e53b4b9bf14f7c16b676f312ae3801fee6dfb826f7764aab758f6af6afc273cbcbf3b632e397ae2b38e'
        '1c12c015380367b599cb56cabfdcf9065e2cbb04e3145d0dcfdfc5e2cb404926c2851e58383c930f569b67da8f89095164b7d1f482f39fb5e1f5a1c26e1853b0')
options=("!strip")

package(){
 cd "citra-linux-appimage-$_ref"
 install -D -m 755 "citra.AppImage"       "$pkgdir/usr/bin/citra"
 install -D -m 755 "citra-room.AppImage"  "$pkgdir/usr/bin/citra-room"
 install -D -m 755 "citra-qt.AppImage"    "$pkgdir/usr/bin/citra-qt"
 install -D -m 755 "scripting/citra.py"    -t "$pkgdir/usr/bin"
 install -D -m 644 "dist/citra.png"        -t "$pkgdir/usr/share/pixmaps"
 install -D -m 644 "$srcdir/citra.desktop" -t "$pkgdir/usr/share/applications"
}

