# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=autotrace-nomagick
pkgver=0.31.12
pkgrel=1
epoch=1
pkgdesc='A program for converting bitmap to vector graphics (no ImageMagick dependency)'
arch=('x86_64')
url='https://github.com/autotrace/autotrace/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=(
    'glib2'
    'glibc'
    'libgcc'
    'libpng'
    'pstoedit-nomagick')
makedepends=(
    'intltool')
checkdepends=(
    'ffmpeg'
    'procps-ng')
provides=('autotrace')
conflicts=('autotrace')
source=("https://github.com/autotrace/autotrace/archive/${pkgver}/autotrace-${pkgver}.tar.gz")
sha256sums=('0db44ad1be129ccc679f5c314d3f041528fcc111e1210c27f2546dad9793cb6f')

prepare() {
    cd "autotrace-${pkgver}"
    ./autogen.sh
}

build() {
    cd "autotrace-${pkgver}"
    ./configure \
        --prefix='/usr' \
        --disable-static \
        --without-magick \
        --with-png \
        --with-pstoedit
    make
}

check() {
    make -C "autotrace-${pkgver}" check
}

package() {
    make -C "autotrace-${pkgver}" DESTDIR="$pkgdir" install
}
