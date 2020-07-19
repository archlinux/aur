# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=python-pywpsrpc
pkgver=2.1.0
pkgrel=1
pkgdesc="Python bindings for WPS Office RPC"
url="https://github.com/timxx/pywpsrpc"
arch=('x86_64')
license=('MIT')
depends=('qt5-base' 'wps-office')
makedepends=('sip5' 'qt5-base')
source=("https://pypi.python.org/packages/source/p/pywpsrpc/pywpsrpc-${pkgver}.tar.gz")
sha256sums=('be8d0cc6ffa275064d0acb9267a77afc21f9e693585305665797a8b620850a3e')

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
