# Maintainer: Mahor Foruzesh <mahorforuzesh at pm dot me>

pkgname=tachidesk-sorayomi
__pkgname="$pkgname"
__PkgName="$(echo "$__pkgname" | sed -e "s/\b./\u\0/g")"
__binname="$(echo "$__pkgname" | tr - _)"
pkgver=0.1.2
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('zenity')
optdepends=('tachidesk-server')
makedepends=('flutter-beta')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('503d26db1e8bb5ad8cc4963a30afe1e9f9e4a3bfc500c8392809fe4a3e6eaaf6')

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
    install -Dm644 "assets/images/icon.png" "$pkgdir/usr/share/pixmaps/$__pkgname.png"
    install -dm755 "$pkgdir/usr/bin/"
    ln -sr "$pkgdir/opt/$__pkgname/$__binname" "$pkgdir/usr/bin/$__pkgname"
}
