#Maintainer: NiNjA <heinep at gmail dot com>

_pkgname=julius
pkgname=$_pkgname-game
pkgver=1.3.1
pkgrel=1
pkgdesc="Open source re-implementation of Caesar III (Original copy required)"
arch=('i686' 'x86_64')
url="https://github.com/bvschaik/julius"
license=('AGPL')
makedepends=('cmake')
depends=('sdl2' 'sdl2_mixer')
install="$pkgname.install"
source=($pkgname.desktop $pkgname.install $url/archive/v$pkgver.tar.gz)
sha256sums=('d44482503d890ab62e64f607c67b5c9686de68e17411920d3c02d54d468ac2a2'
            '903b97f1a07bf4fa8495166c00e45fd1c2ec5fba4d25169cf5f810e51781ac40'
            '7ffbee8f05c6e4b03615853b366c4e3a7037e22c63929fdeae1bedb1f1ebea73')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    cmake .
    make
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver/$_pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm664 "$srcdir/$_pkgname-$pkgver/res/julius_48.png" "$pkgdir/usr/share/pixmaps/${pkgname}48.png"
    install -Dm664 "$srcdir/$_pkgname-$pkgver/res/julius_256.png" "$pkgdir/usr/share/pixmaps/${pkgname}256.png"
    install -Dm664 "$srcdir/$_pkgname-$pkgver/res/julius_512.png" "$pkgdir/usr/share/pixmaps/${pkgname}512.png"
    install -Dm664 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
