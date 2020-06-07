# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=python-pywpsrpc
pkgver=2.0.0
pkgrel=1
pkgdesc="Python bindings for WPS Office RPC"
url="https://github.com/timxx/pywpsrpc"
arch=('x86_64')
license=('MIT')
depends=('qt5-base' 'wps-office')
makedepends=('sip5' 'qt5-base')
source=("https://pypi.python.org/packages/source/p/pywpsrpc/pywpsrpc-${pkgver}.tar.gz")
sha256sums=('ccd5e07dc817137f86f9af5a20bda9815aa62434b5c9067762d30e5779331372')

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
