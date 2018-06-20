# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

_srcname=libheif
pkgname=libheif-git
pkgver=1.3.2.r0.g2706077
pkgrel=1
pkgdesc='HEIF file format decoder and encoder (git version)'
arch=('i686' 'x86_64')
url='https://github.com/strukturag/libheif/'
license=('GPL3')
depends=('libde265' 'x265')
makedepends=('git' 'libjpeg-turbo' 'libpng' 'libde265' 'x265')
optdepends=('libjpeg-turbo: for heif-convert and heif-enc'
            'libpng: for heif-convert and heif-enc')
provides=('libheif' 'libheif.so')
conflicts=('libheif')
source=('git+https://github.com/strukturag/libheif.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    ./autogen.sh
    
    ./configure \
        --prefix='/usr' \
        --enable-shared='yes' \
        --enable-static='no' \
        --enable-fast-install='yes'
        
    make
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
}
