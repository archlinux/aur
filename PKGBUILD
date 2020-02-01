# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=libheif-git
pkgver=1.6.2.r0.g3824054
pkgrel=1
pkgdesc='HEIF file format decoder and encoder (git version)'
arch=('x86_64')
url='https://github.com/strukturag/libheif/'
license=('GPL3')
depends=('libde265' 'x265' 'gdk-pixbuf2' 'shared-mime-info')
makedepends=('git' 'libjpeg' 'libpng')
optdepends=('libjpeg: for heif-convert and heif-enc'
            'libpng: for heif-convert and heif-enc')
provides=('libheif')
conflicts=('libheif')
source=('git+https://github.com/strukturag/libheif.git')
sha256sums=('SKIP')

prepare() {
    cd libheif
    ./autogen.sh
}

pkgver() {
    cd libheif
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd libheif
    ./configure \
        --prefix='/usr' \
        --enable-static='no'
    make
}

package() {
    make -C libheif DESTDIR="$pkgdir" install
}
