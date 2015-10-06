# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=hyperrogue
pkgver=6.6
_pkgver=66
pkgrel=1

# set to '' (for full music) or '-nomusic' or '-lo' to choose
_music='-nomusic'

pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world.  Optional music."
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL2')
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa')
source=("http://www.roguetemple.com/z/hyper/$pkgname-${_pkgver}${_music}.zip")
md5sums=('0ce287a72461b05a0f2f98bf50bb2c00')
if [[ "$_music" == "" ]]; then
    md5sums=('90e3d36695ba9944cd2357f14d0f0dc1')
fi
if [[ "$_music"  == "-lo" ]]; then
    md5sums=('8476e7b432aa2d6707e3de37e61df2c0')
fi

build() {
    cd "$srcdir/$pkgname-${_pkgver}${_music}"
    chmod -x *
    sed -i 's|DejaVuSans-Bold.ttf|/usr/share/hyperrogue/&|' graph.cpp
    make
}

package() {
    cd "$srcdir/$pkgname-${_pkgver}${_music}"
    install -Dm755 hyper      "$pkgdir/usr/bin/hyperrogue"
    install -Dm644 DejaVuSans-Bold.ttf "$pkgdir/usr/share/hyperrogue/DejaVuSans-Bold.ttf"
    if [[ -z "$_music" ]]; then
	install -Dm644 hyperrogue-music.txt "$pkgdir/usr/share/hyperrogue/hyperrogue-music.txt"
	cp *.ogg "$pkgdir/usr/share/hyperrogue/"
    fi
}


