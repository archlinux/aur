# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=python-pywpsrpc
pkgver=1.0.0b2
pkgrel=1
pkgdesc="Python bindings for WPS Office RPC"
url="https://github.com/timxx/pywpsrpc"
arch=('x86_64')
license=('MIT')
depends=('qt5-base' 'wps-office>=11.1.0.9080')
makedepends=('sip5' 'qt5-base')
source=("https://pypi.python.org/packages/source/p/pywpsrpc/pywpsrpc-${pkgver}.tar.gz")
sha256sums=('35723c58bc0c715129ae1b2219346e81deede701eb13080f8747ecc7bc626468')

build() {
    cd "${srcdir}/pywpsrpc-${pkgver}"
    sip-build
}

package() {
    cd "${srcdir}/pywpsrpc-${pkgver}/build"
    make INSTALL_ROOT="${pkgdir}" install -j1

    python -m compileall -d / "${pkgdir}/usr/lib"
    python -O -m compileall -d / "${pkgdir}/usr/lib"
}
