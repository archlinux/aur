# Maintainer: fft
# Contributor: Roy Oursler <roy.j.oursler@intel.com>

pkgname=isa-l_crypto
pkgver=2.26
pkgrel=1
pkgdesc="A collection of optimized low-level functions targeting storage applications"
arch=(x86_64)
url="https://github.com/intel/${pkgname}"
license=('BSD-3-Clause')
makedepends=('autoconf' 'automake' 'make' 'nasm')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('2b20262b6c759be487e75691a85a30d5fe463f868157c65e47bd3f66399882b791ca515dc7838b2384ef8f86746ddbddf87249ce10b29f895a850274cae5f350')

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
