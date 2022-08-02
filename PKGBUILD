# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cnmatrix
pkgver=0.0
pkgrel=1
pkgdesc='C interface to a few matrix backends'
arch=('x86_64')
url='https://github.com/cntools/cnmatrix/'
license=('MIT')
depends=('cblas' 'lapacke')
makedepends=('cmake' 'eigen')
source=("https://github.com/cntools/cnmatrix/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c9c43791b258feb25436288b1e219566903d72a158c81480a2185f21b0648426')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_TESTS:BOOL='ON' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
