# Maintainer: Can Altıparmak (gulaghad) <can6dev <AT> gmail <DOT> com>

pkgname=tmxparser-git
pkgver=124.9aa25dd
pkgrel=1
pkgdesc="Library for parsing TMX files (Tiled Maps) using TinyXML's DOM interface."
url='https://github.com/andrewrk/tmxparser'
license=('BSD')
depends=('tinyxml2' 'zlib')
makedepends=('git')
replaces=('tmx-parser-svn')
arch=('i686' 'x86_64')
source=("$pkgname"::'git://github.com/andrewrk/tmxparser.git')
md5sums=('SKIP')
options=('staticlibs')

pkgver() {
	cd "$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd $pkgname/build
    make DESTDIR="$pkgdir/" install
    cd ..
    install -m 644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
