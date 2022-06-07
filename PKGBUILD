# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=tachidesk
pkgver=0.6.3_r1100
pkgrel=2
__pkgname=tachidesk-server
__PkgName=Tachidesk-Server
__pkgver="${pkgver%_*}"
__revnum="${pkgver#*_r}"
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/$__PkgName"
license=("MPL2")
depends=("java-runtime>=8")
optdepends=("electron: running in Electron")
provides=("$pkgname" "$__pkgname")
conflicts=("$pkgname-preview")
__jar=$__PkgName-v$__pkgver-r$__revnum.jar
source=("$url/releases/download/v$__pkgver/$__jar"
        "$__pkgname.conf"
        "$__pkgname.service"
        "$__pkgname.sysusers"
        "$__pkgname.tmpfiles"
        "$__pkgname.desktop"
        "$__pkgname.png"
        "$__pkgname-browser-launcher.sh"
        "$__pkgname-debug-launcher.sh"
        "$__pkgname-electron-launcher.sh")
sha256sums=('533afe39862d2af2826b9c8b5e31653b63ffd13c3fc20512e33814caa39eb5ca'
            'f0645eb6855fcb854dd42c000ad0ca1895b67017234d79a93cefb9b90e9b3ef6'
            'b8ae15e5dec2d20bedf4827b56a65d48b0155bd86a21147604fb714ee4208c59'
            'd968233df273640b51cd3daf61bab809df6fb844bee92f4f5887c09d95c482aa'
            '715b5ad6ecdcab24f7a7663c3b606654a6c7bd6323540d29ad1440b0116e046d'
            '7ec4e0722d0312384672ccd01d939cce0fe356cf16d23f3473e7502cdddbccd3'
            '7528715b5b8d8360a9fd7dc096b51fd52bf3da671167e224b6cb637437fc4831'
            '1a075de252d4d1e4a025e26d379985995893e03d2ac9182ab8a48624b7076470'
            '39636e9a235e129312cbea43ffdaa3739fa24737e1d6b3388b354d0219272f8b'
            '62ad320c6cc48a8adb2013dfa9f8bab43b1e1401dc0c36ce53bc0b583fccdd21')
noextract=("$__jar")

package() {
    install -Dm644 "$srcdir/$__pkgname.conf"                    "$pkgdir/etc/tachidesk/server.conf"
    install -Dm644 "$srcdir/$__pkgname.service"                 "$pkgdir/usr/lib/systemd/system/$__pkgname.service"
    install -Dm644 "$srcdir/$__pkgname.sysusers"                "$pkgdir/usr/lib/sysusers.d/$__pkgname.conf"
    install -Dm644 "$srcdir/$__pkgname.tmpfiles"                "$pkgdir/usr/lib/tmpfiles.d/$__pkgname.conf"
    install -Dm644 "$srcdir/$__jar"                             "$pkgdir/usr/share/java/$__pkgname/$__pkgname.jar"
    install -Dm644 "$srcdir/$__pkgname.desktop"                 "$pkgdir/usr/share/applications/$__pkgname.desktop"
    install -Dm644 "$srcdir/$__pkgname.png"                     "$pkgdir/usr/share/pixmaps/$__pkgname.png"
    install -Dm755 "$srcdir/$__pkgname-browser-launcher.sh"     "$pkgdir/usr/bin/$__pkgname-browser"
    install -Dm755 "$srcdir/$__pkgname-debug-launcher.sh"       "$pkgdir/usr/bin/$__pkgname-debug"
    install -Dm755 "$srcdir/$__pkgname-electron-launcher.sh"    "$pkgdir/usr/bin/$__pkgname-electron"
    ln -sr  "$pkgdir/usr/bin/$__pkgname-browser"    "$pkgdir/usr/bin/tachidesk" # keep backwards compatibility
}
