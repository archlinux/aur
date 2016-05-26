# Maintainer: Xavier Peng <png.inside@gmail.com>

pkgname=chez-scheme
pkgver=9.4
pkgrel=1
pkgdesc="Chez Scheme is a compiler and run-time system for the language of the Revised^6 Report on Scheme (R6RS), with numerous extensions."
arch=(i686 x86_64)
url="https://github.com/cisco/ChezScheme"
depends=()
license=('APL')
makedepends=('binutils' 'make' 'git' 'ncurses' 'libx11' 'xproto')
conflicts=('petite-chez-scheme' 'chez-scheme-git')
replaces=('petite-chez-scheme' 'chez-scheme-git')
source=("$url/archive/v${pkgver}.tar.gz")
sha1sums=('SKIP')
_archivename=ChezScheme-$pkgver

build() {
    cd "$srcdir/${_archivename}" || exit
    git init
    rm -rf nanopass/ stex/ zlib/
    git submodule add https://github.com/nanopass/nanopass-framework-scheme.git nanopass
    git submodule add https://github.com/dybvig/stex.git stex
    git submodule add https://github.com/madler/zlib.git zlib
    ./configure --installprefix=/usr --temproot=$pkgdir
    make
}

package() {
    cd "${srcdir}/${_archivename}" || exit
    make install DESTDIR="$pkgdir"
}
