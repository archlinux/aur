# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=hyperrogue
pkgver=10.0g
_pkgver=100g
pkgrel=1

# todo: fix music
_music=""

pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world.  Optional music."
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL2')
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa' 'ttf-dejavu')
makedepends=('glu')
source=("http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-src.tgz")
# http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-lq.zip
# http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-win.zip
md5sums=('9ce82a9f3749de2702b52bcfd45349be')
#if [[ "$_music" == "" ]]; then
#    md5sums=('36b723d3b3ae3d4338b25d39c4388360')
#fi
#if [[ "$_music"  == "-lo" ]]; then
#    md5sums=('1d009127962c9d216e865866aead6aa0')
#fi

prepare() {
    cd "$srcdir/$pkgname${_pkgver}-src"
    sed -i 's|TTF_OpenFont.*;|TTF_OpenFont("/usr/share/fonts/TTF/DejaVuSans-Bold.ttf", siz);|' basegraph.cpp
    #sed -i 's|<SDL.h>|"SDL.h"|' /usr/include/SDL/SDL_gfxPrimitives.h  # todo: confirm bug and open
    sed -i 's|g++ hyper.cpp .*$|& -I/usr/include/SDL/|' Makefile  # remove when above bug is fixed
}

build() {
    cd "$srcdir/$pkgname${_pkgver}-src"
    make
}

package() {
    cd "$srcdir/$pkgname${_pkgver}-src"
    install -Dm755 hyper "$pkgdir/usr/bin/hyperrogue"
    #if [[ -z "$_music" ]]; then
    #    install -Dm644 hyperrogue-music.txt "$pkgdir/usr/share/hyperrogue/hyperrogue-music.txt"
    #    cp *.ogg "$pkgdir/usr/share/hyperrogue/"
    #fi
}


