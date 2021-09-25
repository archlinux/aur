# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=pstoedit-nomagick
pkgver=3.77
pkgrel=1
pkgdesc='Translates PS/PDF graphics to other vector formats (no ImageMagick dependency)'
arch=('x86_64')
url='http://www.pstoedit.net/'
license=('GPL')
depends=('gd' 'ghostscript' 'ming' 'libemf' 'libzip' 'plotutils' 'zlib')
provides=('pstoedit')
conflicts=('pstoedit')
source=("https://sourceforge.net/projects/pstoedit/files/pstoedit/${pkgver}/pstoedit-${pkgver}.tar.gz")
sha256sums=('9a6c6b02ea91e9f836448ccc5a614caa514a9ba17e94f1d6c0babc72a4395b09')

build() {
    cd "pstoedit-${pkgver}"
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
    make -C "pstoedit-${pkgver}" check
}

package() {
    make -C "pstoedit-${pkgver}" DESTDIR="$pkgdir" install
}
