# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=pstoedit-nomagick
pkgver=3.75
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
source=("https://sourceforge.net/projects/pstoedit/files/pstoedit/${pkgver}/pstoedit-${pkgver}.tar.gz")
sha256sums=('b7b5d8510b40a5b148f7751268712fcfd0c1ed2bb46f359f655b6fcdc53364cf')

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
