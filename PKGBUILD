# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Sebastian-byte <sebastianmontoya209 at gmail dot com>
# Contributor: Mendel Greenberg <mendel at chabad 360 dot me>
# Contributor: Tom Bebbington <tophattedcoder at gmail dot com>

pkgbase="citra-bin"
pkgname=("citra-bin" "citra-qt-bin")
# to update: reset $pkgrel to 1, go to https://github.com/citra-emu/citra-nightly/releases and copy $pkgver (release) and $_ref (date-commit)
_ref=20221113-94d0399
pkgver=1809
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
url="https://citra-emu.org"
license=("GPL2")
arch=("x86_64")
provides=("citra")
conflicts=("citra-git"
           "citra-canary-bin"
           "citra-canary-git"
           "citra-qt-git"
           "citra-qt-canary-bin")
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/citra-emu/citra-nightly/releases/download/nightly-$pkgver/citra-linux-$_ref.tar.xz"
        "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.desktop")
sha256sums=('66e073a865bb508d792bb8d5b5be7c40af413a65fbd7dc9557ab83ca392154de'
            'b4c9433fbcbb1b9ddf19f009252e89d8d653ebac7f67d5d0beb49259f583ab69')

package_citra-bin(){
 pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger, CLI version, already compiled"
 depends+=("sndio")
 replaces=("citra-nightly-bin")
 conflicts+=("citra-qt-bin")
 cd "$srcdir/citra-linux-$_ref"
 install -D -m 755 "citra" "$pkgdir/usr/bin/citra"
 install -D -m 755 "citra-room" "$pkgdir/usr/bin/citra-room"
}

package_citra-qt-bin(){
 pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger, GUI version, already compiled"
 depends+=("desktop-file-utils"
           "qt5-multimedia")
 optdepends=("libxkbcommon-x11: x11 support"
	         "qt5-wayland: wayland support")
 replaces=("citra-qt"
           "citra-qt-nightly-bin")
 conflicts+=("citra-bin")
 cd "$srcdir/citra-linux-$_ref"
 install -D -m 755 "citra-qt" "$pkgdir/usr/bin/citra-qt"
 install -D -m 755 "citra-room" "$pkgdir/usr/bin/citra-room"
 install -D -m 644 "dist/citra.png" "$pkgdir/usr/share/pixmaps/citra.png"
 install -D -m 644 "$srcdir/citra.desktop" "$pkgdir/usr/share/applications/citra.desktop" 
}
