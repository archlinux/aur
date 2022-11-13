# Maintainer: Iván Gabaldón <contact|@|inetol.net>

pkgname=deskreen-bin
_pkgname=deskreen
pkgver=2.0.4
pkgrel=1
pkgdesc='Turns any device with a web browser to a second screen for your computer (binary release)'
arch=('x86_64')
url='https://deskreen.com'
license=('AGPL3')
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.deb::https://github.com/pavlobu/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
        "$_pkgname.desktop"
        "LICENSE::https://raw.githubusercontent.com/pavlobu/$_pkgname/v$pkgver/LICENSE")
b2sums=('cdc2e257681628bb8f0320672b626a920b84346aa70af6389592fe84ca625b7ada7e3dd41889989bcf0993928694a302c42a852ae006729b262f72b3b238ec91'
        '3881f39f5f70cee917862b55a1e010e766b94fc5b332423fb3999cc05a137ed4cf70955eb1636688d579a8c996a4ddbda2952cf5de0a4565f04adfe403117d6c'
        '6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237')

prepare() {
    mkdir -p "$_pkgname-$pkgver"
    bsdtar -xpf 'data.tar.xz' -C "$_pkgname-$pkgver"
}

package() {
    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/$_pkgname-$pkgver/opt/Deskreen/"* "$pkgdir/opt/$_pkgname"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -d "$pkgdir/usr/share/icons"
    cp -r "$srcdir/$_pkgname-$pkgver/usr/share/icons/"* "$pkgdir/usr/share/icons/"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
