# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>
# Maintainer: Padya1201 <padya1201 at gmail dot com>

pkgname=tachidesk-sorayomi-bin
_pkgname="${pkgname%-bin}"
_PkgName="$(echo "$_pkgname" | sed -e "s/\b./\u\0/g")"
_binname="$(echo "$_pkgname" | tr - _)"
pkgver=0.6.3
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$_PkgName"
license=('MPL2')
depends=('zenity' 'xdg-user-dirs' 'at-spi2-core')
optdepends=('tachidesk-server')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-x64.tar.gz")
sha256sums=('6bc97d5298bc55698e66085e29a0c9b84e3a3af0d4e0b38ae6bb34ce5e04b650')

package() {
	cd ${pkgdir}

    mkdir -p usr/share/applications usr/share/icons/hicolor/1024x1024/apps usr/bin opt/$_PkgName
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "usr/share/applications/"
    install -Dm644 "${srcdir}/${_pkgname}.png" "usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
    cp -a "${srcdir}/data/" "${srcdir}/lib/" "${srcdir}/${_binname}" "opt/$_PkgName/"
    ln -sr "opt/$_PkgName/$_binname" "$pkgdir/usr/bin/${_pkgname}"

    # cd "$srcdir/"
    # install -dm755 "$pkgdir/opt/$__pkgname/"
    # cp -a "data/" "lib/" "$__binname" "$pkgdir/opt/$__pkgname/"
    # install -dm755 "$pkgdir/usr/bin/"
    # ln -sr "$pkgdir/opt/$__pkgname/$__binname" "$pkgdir/usr/bin/$__pkgname"
    # install -Dm644 "$__pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    # install -Dm644 "$__pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
}
