# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=python-pywpsrpc
pkgver=1.0.2
pkgrel=1
pkgdesc="Python bindings for WPS Office RPC"
url="https://github.com/timxx/pywpsrpc"
arch=('x86_64')
license=('MIT')
depends=('qt5-base' 'wps-office')
makedepends=('sip5' 'qt5-base')
source=("https://pypi.python.org/packages/source/p/pywpsrpc/pywpsrpc-${pkgver}.tar.gz")
sha256sums=('a7819a8a2b18a9a8d60344b01d384acc7af257395205d6f53902611181d3c29d')

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
