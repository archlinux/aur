# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=igsc
pkgver=0.2.3
_meteever=3.1.0
pkgrel=1
pkgdesc='Intel Graphics System Controller Firmware Update'
arch=('x86_64')
url='https://github.com/intel/igsc/'
license=('Apache')
depends=('systemd-libs')
makedepends=('git' 'cmake' 'systemd')
source=("https://github.com/intel/igsc/archive/V${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "git+https://github.com/intel/metee.git#tag=${_meteever}")
sha256sums=('2e951cf6a21bf69fc80669f6df41a0678ee830f2ef61e0f5d3fba1ddd06d0e1c'
            'SKIP')

build() {
    export LIBMETEE_REPO="${srcdir}/metee"
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_WERROR:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
