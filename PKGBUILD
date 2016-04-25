# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=hyperrogue
pkgver=7.4h
_pkgver=74h
pkgrel=1

# set to '' (for full music) or '-nomusic' or '-lo' to choose
_music='-nomusic'

pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world.  Optional music."
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL2')
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa')
source=("http://www.roguetemple.com/z/hyper/$pkgname-${_pkgver}${_music}.zip")
md5sums=('bded083adda84a70286fefd20c53ad06')
if [[ "$_music" == "" ]]; then
    md5sums=('ed8e026d14332deb1808bb841ea041f1')
fi
if [[ "$_music"  == "-lo" ]]; then
    md5sums=('74a053f1cdccdcde9433293cea1160cb')
fi

build() {
    cd "$srcdir/$pkgname-${_pkgver}${_music}"
    chmod -x *
    sed -i 's|DejaVuSans-Bold.ttf|/usr/share/hyperrogue/&|' graph.cpp
    make
}

package() {
    cd "$srcdir/$pkgname-${_pkgver}${_music}"
    install -Dm755 hyper "$pkgdir/usr/bin/hyperrogue"
    install -Dm644 DejaVuSans-Bold.ttf "$pkgdir/usr/share/hyperrogue/DejaVuSans-Bold.ttf"
    if [[ -z "$_music" ]]; then
	install -Dm644 hyperrogue-music.txt "$pkgdir/usr/share/hyperrogue/hyperrogue-music.txt"
	cp *.ogg "$pkgdir/usr/share/hyperrogue/"
    fi
}


