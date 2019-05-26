# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# pstoedit compiled without ImageMagick dependency

_srcname=pstoedit
pkgname=pstoedit-nomagick
pkgver=3.73
pkgrel=2
pkgdesc='Translates PS/PDF graphics to other vector formats (no ImageMagick dependency)'
arch=('i686' 'x86_64')
url='http://www.pstoedit.net/'
license=('GPL')
depends=(
    # official repositories:
        'gcc-libs' 'gd' 'ming' 'libzip' 'plotutils' 'ghostscript'
    # AUR:
        'libemf'
)
provides=('pstoedit')
conflicts=('pstoedit')
source=("https://sourceforge.net/projects/pstoedit/files/pstoedit/${pkgver}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('ad31d13bf4dd1b9e2590dccdbe9e4abe74727aaa16376be85cd5d854f79bf290')

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

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
