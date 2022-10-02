# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname=intel-ipsec-mb
pkgver=1.3
pkgrel=1
pkgdesc='Intel(R) Multi-Buffer Crypto for IPsec Library'
url='https://github.com/intel/intel-ipsec-mb'
arch=('x86_64')
license=('BSD')
depends=('glibc')
makedepends=('nasm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/intel/intel-ipsec-mb/archive/v${pkgver}.tar.gz")
b2sums=('f7ae09cb2721a0193879ee4a3a04fa6d190ebcd70c681a1f885554dbd644d39511cd0832eb22edc5566d72f0fcaba955450d2208b17a040f053aef6134e174b0')

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
