# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=autotrace-nomagick
pkgver=0.31.11
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
sha256sums=('da595b49d2419ef7f771533f46710c92a0267e380b8ff8a4ca8b9f2f41a76093')

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
