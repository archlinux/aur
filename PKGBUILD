# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname=intel-ipsec-mb
pkgver=1.5
pkgrel=1
pkgdesc='Intel(R) Multi-Buffer Crypto for IPsec Library'
url='https://github.com/intel/intel-ipsec-mb'
arch=('x86_64')
license=('BSD')
depends=('glibc')
makedepends=('nasm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/intel/intel-ipsec-mb/archive/v${pkgver}.tar.gz")
b2sums=('b4a2ac6b5671721ec79c100be86270c1b4344be731c40bafda58d4f718169e37d5bd1c6b3a14a1917dedb151daa3f732a01961255a94e9628efb0c4e588d47e1')

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
