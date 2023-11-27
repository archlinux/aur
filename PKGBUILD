# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="citra-appimage"
# to update:
#       1. reset $pkgrel to 1
#       2. go to https://github.com/citra-emu/citra-nightly/releases
#       3. copy release to $pkgver
#       4. copy date-commit to $_ref
_ref=20231126-83b329f
pkgver=2045
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
b2sums=('0789fddc5f6b526ce0bec5ad8fbaba2acd8ec584a41530a4f18728d1b0b4602ae09ad8d6767ba845b6eb4c945583767e58bf8ae0b348751ef687d86bd9bd789d'
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

