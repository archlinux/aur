# Maintainer: Danny Holman <dholman@gymli.org>
pkgname=mingw-w64-tmxparser-git
pkgver=185.da62e19
pkgrel=1
pkgdesc="Library for parsing TMX files (Tiled Maps) using TinyXML's DOM interface. (mingw-w64)"
arch=('i686' 'x86_64')
url="https://github.com/sainteos/tmxparser.git"
license=('BSD')
groups=('mingw-w64')
depends=('mingw-w64-tinyxml2' 'mingw-w64-zlib' 'mingw-w64-crt')
makedepends=('git' 'mingw-w64-gcc')
options=('!strip' 'staticlibs' '!buildflags')
source=("$pkgname"::'git://github.com/sainteos/tmxparser.git')
noextract=()
md5sums=('SKIP')

pkgver() {
        cd "$pkgname"
        printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd $pkgname
        mkdir build
        cd build
        $(uname -m)-w64-mingw32-cmake -DCMAKE_INSTALL_PREFIX=/usr/$(uname -m)-w64-mingw32 ..
        make
}

package() {
        cd $pkgname/build
        make DESTDIR="$pkgdir/" install
        cd ..
        install -m 644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
