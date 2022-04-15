# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# 10-bit depth is not supported currently
# https://github.com/pkuvcl/xavs2/blob/1.4/build/linux/configure#L500

pkgname=xavs2
pkgver=1.4
pkgrel=1
arch=('x86_64')
pkgdesc='Open-Source encoder of AVS2-P2/IEEE1857.4 video coding standard'
url='https://github.com/pkuvcl/xavs2/'
license=('GPL')
depends=('glibc' 'liblsmash.so')
makedepends=('nasm' 'l-smash')
provides=('libxavs2')
conflicts=('libxavs2')
replaces=('libxavs2')
options=('!lto')
source=("https://github.com/pkuvcl/xavs2/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1e6d731cd64cb2a8940a0a3fd24f9c2ac3bb39357d802432a47bc20bad52c6ce')

build() {
    cd "${pkgname}-${pkgver}/build/linux"
    ./configure \
        --prefix='/usr' \
        --enable-shared \
        --bit-depth='8' \
        --chroma-format='all' \
        --enable-pic \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac
    make
}

package() {
    make -C "${pkgname}-${pkgver}/build/linux" DESTDIR="$pkgdir" install-cli install-lib-shared
}
