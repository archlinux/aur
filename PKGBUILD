# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=tachidesk-sorayomi-bin
__pkgname="${pkgname%-bin}"
__PkgName="$(echo "$__pkgname" | sed -e "s/\b./\u\0/g")"
__binname="$(echo "$__pkgname" | tr - _)"
pkgver=0.2.2
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('zenity')
optdepends=('tachidesk-server')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=("$url/releases/download/$pkgver/$__pkgname-$pkgver-linux-x64.tar.gz")
sha256sums=('d1050891c4ab56643287958f9c5bc5c0072ec1bdb991cc111af87e973f34b41f')

package() {
    cd "$srcdir/"
    install -dm755 "$pkgdir/opt/$__pkgname/"
    cp -a "data/" "lib/" "$__binname" "$pkgdir/opt/$__pkgname/"
    install -dm755 "$pkgdir/usr/bin/"
    ln -sr "$pkgdir/opt/$__pkgname/$__binname" "$pkgdir/usr/bin/$__pkgname"
    install -Dm644 "$__pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$__pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
}
