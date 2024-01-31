# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Giusy Margarita <kurmikon at libero dot it>

pkgname=mpv-acestream
pkgver=0.5
pkgrel=1
pkgdesc="Lua script that adds AceStream protocol handler to mpv player"
arch=("any")
url="https://github.com/Digitalone1/mpv-acestream"
license=('GPL-3.0-or-later')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
    "acestream.protocol")
install="$pkgname.install"
b2sums=('492e2aecc38198e33073a0296e4b6b3beaad2800f796b4d2aaa9a2f91bd2f05cf6ed1b7cc2ecbae6addf329fd19c669aaf3b9dda67a0cc4bbfe66fe9246124ed'
        '92b697c41f5dec7f0761580e15d3c85c246b1c0de9aa211aa4a0efa3a1988575592411c4695003ff52133b328a7ac7ba11163ec3187bc4f80aeb729476fe15e1')

package() {
    depends=(
        'acestream-engine-py3'
        'mpv'
    )
    optdepends=(
        'kio5: acestream protocol support on KDE Plasma 5'
    )

    cd $pkgname-$pkgver

    install -Dm755 "scripts/$pkgname.lua" "$pkgdir/usr/lib/mpv/$pkgname.lua"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Plasma 5 protocol file
    install -Dm644 "$srcdir/acestream.protocol" "$pkgdir/usr/share/kservices5/acestream.protocol"
} 
