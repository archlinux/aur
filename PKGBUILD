# Maintainer: Mahor1221 <mahor1221 at pm dot me>
# Maintainer: Padya1201 <padya1201 at gmail dot com>

pkgname=tachidesk-sorayomi
__pkgname="$pkgname"
__PkgName="$(echo "$__pkgname" | sed -e "s/\b./\u\0/g")"
__binname="$(echo "$__pkgname" | tr - _)"
pkgver=0.5.3
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('zenity' 'xdg-user-dirs')
optdepends=('tachidesk-server')
makedepends=('flutter' 'cmake' 'clang' 'ninja')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0fa0fbba9657ba3ef5d8a0b814b9850281ce181313a4413bf3e2deffbbe60c07')

build() {
    cd "$__PkgName-$pkgver/"
    flutter config --enable-linux-desktop
    flutter pub get
    flutter build linux --release
}

package() {
    cd "$__PkgName-$pkgver/"
    install -dm755 "$pkgdir/opt/$__pkgname/"
    cp -a "build/linux/x64/release/bundle/" -T "$pkgdir/opt/$__pkgname/"
    install -Dm644 "scripts/$__pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "assets/icons/launcher/sorayomi_icon.png" "$pkgdir/usr/share/pixmaps/$__pkgname.png"
    install -dm755 "$pkgdir/usr/bin/"
    ln -sr "$pkgdir/opt/$__pkgname/$__binname" "$pkgdir/usr/bin/$__pkgname"
}
