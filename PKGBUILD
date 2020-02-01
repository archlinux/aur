# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265-git
pkgver=1.0.5.r0.g19db0e8f
pkgrel=1
pkgdesc='Open H.265 video codec implementation (git version)'
arch=('x86_64')
url='https://github.com/strukturag/libde265/'
license=('LGPL3')
depends=('gcc-libs')
makedepends=('git' 'ffmpeg' 'sdl' 'qt5-base')
optdepends=('ffmpeg: for sherlock265'
            'qt5-base: for sherlock265'
            'sdl: for dec265 YUV overlay output')
provides=('libde265')
conflicts=('libde265')
source=('git+https://github.com/strukturag/libde265.git')
sha256sums=('SKIP')

prepare() {
    cd libde265
    ./autogen.sh
}

pkgver() {
    cd libde265
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd libde265
    ./configure \
        --prefix='/usr' \
        --enable-static='no' \
        --enable-sse
    make
}

package() {
    make -C libde265 DESTDIR="$pkgdir" install
    mv "${pkgdir}/usr/bin/"{tests,de265-tests}
}
