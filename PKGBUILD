# Maintainer: Tim Wanders <tim241 at mailbox dot org>
# Contributor: AdriÃƒÂ¡n Chaves FernÃƒÂ¡ndez, aka Gallaecio <adriyetichaves@gmail.com>

pkgname=speed-dreams-svn
pkgver=svn
pkgrel=1
pkgdesc="Speed Dreams is a fork of TORCS which aims to implement exciting new features, improving visual and physics realism."
arch=('i686' 'x86_64')
url="http://speed-dreams.sourceforge.net/"
license=('GPL2')
depends=('freealut' 'freeglut' 'libpng' 'libxi' 'libxmu' 'libxrandr' 'plib>=1.8.3' 'libjpeg' 'zlib' 'enet' 'openscenegraph')

makedepends=('cmake' 'svn')

source=("${pkgname}.desktop"
        "$pkgname::svn+https://svn.code.sf.net/p/speed-dreams/code/trunk")

md5sums=("9a0a63c897668ee18bcd6c5d65fe2111"
         "SKIP")

prepare() {
    cd "$srcdir/$pkgname"

    if [ -d build ]
    then
        rm -rf build
    fi

    mkdir build
    
    cd build
    cmake ../ -Wno-dev
}

build() {
    cd "$srcdir/$pkgname/build"
    
    make
}

package() {
    cd "$srcdir/$pkgname/build"

    make DESTDIR="$pkgdir" install

    install -D -m644 "${pkgdir}/usr/local/share/games/speed-dreams-2/data/icons/icon.png" \
        "${pkgdir}/usr/share/pixmaps/speed-dreams-2.png"
    install -D -m644 "$srcdir/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/speed-dreams-svn.desktop"
}
