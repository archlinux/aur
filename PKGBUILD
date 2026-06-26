# Maintainer: fft
# Contributor: Roy Oursler <roy.j.oursler@intel.com>

pkgname=isa-l_crypto
pkgver=2.26.1
pkgrel=1
pkgdesc="A collection of optimized low-level functions targeting storage applications"
arch=(x86_64)
url="https://github.com/intel/${pkgname}"
license=('BSD-3-Clause')
makedepends=('autoconf' 'automake' 'make' 'nasm')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('fa181cdc4915d12d1ee69109a561800e853caab91566f2d24426ab1ecff58f3bff5b4f8b71c3b0f782cb0ec5a9a2d6942dd43d904accfa737a6a4ccd9bc97b7e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CFLAGS="${CFLAGS} -fno-strict-aliasing"
    ./autogen.sh
    ./configure
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
    make tests
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
