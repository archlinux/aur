# Maintainer: Iván Gabaldón <contact|@|inetol.net>

pkgname=deskreen-bin
_pkgname=deskreen
pkgver=2.0.3
pkgrel=2
pkgdesc='Turns any device with a web browser to a second screen for your computer (binary release)'
arch=('x86_64')
url='https://deskreen.com'
license=('AGPL3')
depends=('nss')
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.deb::https://github.com/pavlobu/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
        "$_pkgname.desktop"
        "LICENSE::https://raw.githubusercontent.com/pavlobu/$_pkgname/v$pkgver/LICENSE")
b2sums=('dabb624b9dfb4ea057d05d3cb47cc807fce421342fb82c9f8512b396c5d16f3f5b37eb5a171ff6b83179609971e6636000264ac7ce729746cf25e6044b54ff94'
        'ba7d1537ead5757091ec51da21ad1751bb1dcad2fe90cb3b5377f0507f9484643f0d9d784b23d7dccc88fe5f54d9559fd2e945ad4c6170614f1b04979c64e802'
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
