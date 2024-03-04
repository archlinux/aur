# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="citra-appimage"
# to update:
#       1. reset $pkgrel to 1
#       2. go to https://github.com/citra-emu/citra-nightly/releases
#       3. copy release to $pkgver
#       4. copy date-commit to $_ref
pkgver=2104
_ref=20240303-0ff3440
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
source=(# dead as of 2024-03-04
        # "https://github.com/citra-emu/citra-nightly/releases/download/nightly-$pkgver/citra-linux-appimage-$_ref.tar.gz"
        "https://archive.org/download/citra-nightly-$pkgver/citra-linux-appimage-$_ref.tar.gz"
        # backup link
        # https://archive.org/download/citra-latest-builds-4th-march-2024
        "citra.desktop")
b2sums=('1baffc877cd1637e8a58f775492debd663d4ef1b1fc7c1fd1d943dca15891efd03d064b4b6be56a9d36550c2bf143951a338ce711ed91fbd162e1e56e4818161'
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

