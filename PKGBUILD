# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahorforuzesh at pm dot me>

pkgname=tachidesk
pkgver=0.6.2_r1074
pkgrel=1
__pkgname=tachidesk-server
__PkgName=Tachidesk-Server
__pkgver="${pkgver%_*}"
__revnum="${pkgver#*_}"
pkgdesc='A free and open source manga reader that runs extensions built for Tachiyomi'
arch=('any')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('java-runtime>=8')
optdepends=('electron: running in Electron')
provides=("$pkgname" "$__pkgname")
conflicts=("$pkgname-preview")
__jar=$__PkgName-v$__pkgver-$__revnum.jar
source=("$url/releases/download/v$__pkgver/$__jar"
        "$__pkgname.desktop"
        "$__pkgname.png"
        "$__pkgname-browser-launcher.sh"
        "$__pkgname-debug-launcher.sh"
        "$__pkgname-electron-launcher.sh")
sha256sums=('fecf9b73f5b9985a7984d2e01ec38944771690a6f2cda4aa9b6eab689ea79a32'
            '22a6a9a8c8198985759f66b35377d87bce82d46dbf7a4a7505b55621a9c5487e'
            '7528715b5b8d8360a9fd7dc096b51fd52bf3da671167e224b6cb637437fc4831'
            '1a075de252d4d1e4a025e26d379985995893e03d2ac9182ab8a48624b7076470'
            '39636e9a235e129312cbea43ffdaa3739fa24737e1d6b3388b354d0219272f8b'
            '354d8e7078d1f83157ee35d47effaa70568552fb41937b8fa4353480a3dff03b')

noextract=("$__jar")

package() {
    install -Dm644 "$srcdir/$__jar"             "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm644 "$srcdir/$__pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$__pkgname.png"     "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm755 "$srcdir/$__pkgname-browser-launcher.sh"  "$pkgdir/usr/bin/$pkgname-browser"
    install -Dm755 "$srcdir/$__pkgname-debug-launcher.sh"    "$pkgdir/usr/bin/$pkgname-debug"
    install -Dm755 "$srcdir/$__pkgname-electron-launcher.sh" "$pkgdir/usr/bin/$pkgname-electron"
    ln -s  "$srcdir/usr/bin/$__pkgname-browser-launcher"     "$pkgdir/usr/bin/$pkgname" # keep backwards compatibility
}
