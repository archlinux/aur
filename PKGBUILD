# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_srcname=pstoedit
pkgname=pstoedit-nomagick
pkgver=3.74
pkgrel=1
pkgdesc='Translates PS/PDF graphics to other vector formats (no ImageMagick dependency)'
arch=('x86_64')
url='http://www.pstoedit.net/'
license=('GPL')
depends=(
    # official repositories:
        'gcc-libs' 'gd' 'ming' 'libzip' 'zlib' 'plotutils' 'ghostscript'
    # AUR:
        'libemf'
)
provides=('pstoedit')
conflicts=('pstoedit')
source=("https://sourceforge.net/projects/pstoedit/files/pstoedit/${pkgver}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('353242fa4a3a73c3c856d1122a4d258a12be869707629603807e27137566990c')

build() {
    cd "${_srcname}-${pkgver}"
    
    ./configure \
        --prefix='/usr'\
        --enable-static='no' \
        --enable-shared='yes' \
        --with-emf \
        --without-magick \
        --with-libplot \
        --with-swf \
        --with-pptx
        
    make
}

check() {
    cd "${_srcname}-${pkgver}"
    
    make check
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
