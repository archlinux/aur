# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=tachidesk
pkgver=0.6.3_r1100
pkgrel=1
__pkgname=tachidesk-server
__PkgName=Tachidesk-Server
__pkgver="${pkgver%_*}"
__revnum="${pkgver#*_}"
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/$__PkgName"
license=("MPL2")
depends=("java-runtime>=8")
optdepends=("electron: running in Electron")
provides=("$pkgname" "$__pkgname")
conflicts=("$pkgname-preview")
__jar=$__PkgName-v$__pkgver-$__revnum.jar
source=("$url/releases/download/v$__pkgver/$__jar"
        "$__pkgname.desktop"
        "$__pkgname.png"
        "$__pkgname-browser-launcher.sh"
        "$__pkgname-debug-launcher.sh"
        "$__pkgname-electron-launcher.sh")
sha256sums=('533afe39862d2af2826b9c8b5e31653b63ffd13c3fc20512e33814caa39eb5ca'
            '7ec4e0722d0312384672ccd01d939cce0fe356cf16d23f3473e7502cdddbccd3'
            '7528715b5b8d8360a9fd7dc096b51fd52bf3da671167e224b6cb637437fc4831'
            '1a075de252d4d1e4a025e26d379985995893e03d2ac9182ab8a48624b7076470'
            '39636e9a235e129312cbea43ffdaa3739fa24737e1d6b3388b354d0219272f8b'
            '62ad320c6cc48a8adb2013dfa9f8bab43b1e1401dc0c36ce53bc0b583fccdd21')

noextract=("$__jar")

package() {
    install -Dm644 "$srcdir/$__jar"             "$pkgdir/usr/share/java/$__pkgname/$__pkgname.jar"
    install -Dm644 "$srcdir/$__pkgname.desktop" "$pkgdir/usr/share/applications/$__pkgname.desktop"
    install -Dm644 "$srcdir/$__pkgname.png"     "$pkgdir/usr/share/pixmaps/$__pkgname.png"
    install -Dm755 "$srcdir/$__pkgname-browser-launcher.sh"  "$pkgdir/usr/bin/$__pkgname-browser"
    install -Dm755 "$srcdir/$__pkgname-debug-launcher.sh"    "$pkgdir/usr/bin/$__pkgname-debug"
    install -Dm755 "$srcdir/$__pkgname-electron-launcher.sh" "$pkgdir/usr/bin/$__pkgname-electron"
    ln -sr  "$pkgdir/usr/bin/$__pkgname-browser" "$pkgdir/usr/bin/$pkgname" # keep backwards compatibility
}
