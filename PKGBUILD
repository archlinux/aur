# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=pstoedit-nomagick
pkgver=4.3
pkgrel=1
pkgdesc='Translates PS/PDF graphics to other vector formats (no ImageMagick dependency)'
arch=('x86_64')
url='https://www.pstoedit.com/'
license=('GPL-2.0-or-later')
depends=(
    'ghostscript'
    'glibc'
    'libemf'
    'libgcc'
    'libstdc++'
    'libzip'
    'plotutils')
makedepends=(
    'texlive-basic'
    'texlive-bin'
    'texlive-latex'
    'texlive-latexrecommended')
provides=('pstoedit')
conflicts=('pstoedit')
source=("https://github.com/woglu/pstoedit/archive/v${pkgver}/pstoedit-${pkgver}.tar.gz")
sha256sums=('36dfdc79c750930dd57e2c4a4dee2a6ab1a1fe65cd8fc4dc047dbfb6f2cfa15b')

prepare() {
    cd "pstoedit-${pkgver}"
    ./autogen.sh
}

build() {
    cd "pstoedit-${pkgver}"
    ./configure \
        --prefix='/usr'\
        --enable-static='no' \
        --enable-shared='yes' \
        --with-emf \
        --without-magick \
        --with-libplot \
        --with-pptx
    make
}

check() {
    make -C "pstoedit-${pkgver}" check
}

package() {
    make -C "pstoedit-${pkgver}" DESTDIR="$pkgdir" install
}
