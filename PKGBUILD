# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=pstoedit-nomagick
pkgver=3.78
pkgrel=1
pkgdesc='Translates PS/PDF graphics to other vector formats (no ImageMagick dependency)'
arch=('x86_64')
url='http://www.pstoedit.net/'
license=('GPL')
depends=('gd' 'ghostscript' 'ming' 'libemf' 'libzip' 'plotutils' 'zlib')
provides=('pstoedit')
conflicts=('pstoedit')
source=("https://sourceforge.net/projects/pstoedit/files/pstoedit/${pkgver}/pstoedit-${pkgver}.tar.gz")
sha256sums=('8cc28e34bc7f88d913780f8074e813dd5aaa0ac2056a6b36d4bf004a0e90d801')

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
