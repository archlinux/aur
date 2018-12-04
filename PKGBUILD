# Maintainer : Daniel Bermond < gmail-com: danielbermond >

_srcname=libheif
pkgname=libheif-git
pkgver=1.3.2.r142.g791fa2d
pkgrel=1
pkgdesc='HEIF file format decoder and encoder (git version)'
arch=('i686' 'x86_64')
url='https://github.com/strukturag/libheif/'
license=('GPL3')
depends=('libde265' 'x265')
makedepends=('git' 'x265' 'libjpeg' 'libpng' 'libde265')
optdepends=('libjpeg: for heif-convert and heif-enc'
            'libpng: for heif-convert and heif-enc')
provides=('libheif')
conflicts=('libheif')
source=('git+https://github.com/strukturag/libheif.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    ./autogen.sh
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    ./configure \
        --prefix='/usr' \
        --enable-shared='yes' \
        --enable-static='no'
        
    make
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
}
