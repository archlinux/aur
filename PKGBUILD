# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname=intel-ipsec-mb
pkgver=1.4
pkgrel=1
pkgdesc='Intel(R) Multi-Buffer Crypto for IPsec Library'
url='https://github.com/intel/intel-ipsec-mb'
arch=('x86_64')
license=('BSD')
depends=('glibc')
makedepends=('nasm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/intel/intel-ipsec-mb/archive/v${pkgver}.tar.gz")
b2sums=('8669716f65ef0fa4a0056eb4a6d5470ad2758b04114c922ff92b7fd6eda280fb54d677d4fe0755197a0b9e60b002910bb389fc5295e6d1ef665982e8d5b3ba26')

build() {
    cd "${pkgname}-${pkgver}"
    # workaround: avoid detection of existing install on test for api changes
    make INSTPATH="/nonexistent/intel-ipsec-mb.h"
}

package() {
    cd "${pkgname}-${pkgver}"
    make install PREFIX="$pkgdir/usr" MAN_DIR="$pkgdir/usr/share/man/man7" NOLDCONFIG=y
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
