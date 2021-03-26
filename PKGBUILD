# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist
pkgver=0.2.0rc5
_srcver=0.2.0-RC5
pkgrel=1
pkgdesc='A library that can be used to add the RIST protocol to applications'
arch=('x86_64')
url='https://code.videolan.org/rist/librist/'
license=('BSD')
depends=('cjson' 'mbedtls')
makedepends=('meson' 'cmake' 'cmocka' 'lz4')
BUILDENV=('!check')
source=("https://code.videolan.org/rist/librist/-/archive/v${_srcver}/${pkgname}-v${_srcver}.tar.bz2")
sha256sums=('bfcac4b78de3139696304a8ec72841fec56370c0b0948044581344d42c6e1ff2')

build() {
    arch-meson build "${pkgname}-v${_srcver}"
    ninja -v -C build
}

check() {
    ninja -v -C build test
}

package() {
    DESTDIR="$pkgdir" ninja -v -C build install
    install -D -m644 "${pkgname}-v${_srcver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
