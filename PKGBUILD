# Maintainer: Tianhao Wang <i AT shrik3 DOT com>
#
pkgname=libsx
pkgver=2.08
pkgrel=1
url='https://web.physics.wustl.edu/marty/libsx/libsx.html'
pkgdesc='the simple X library'
arch=('x86_64' 'i686')
depends=(glibc libxext libxmu libice libsm libxpm libxt libx11 libxext libxaw3dxft)
provides=(libsx libsx.so)
license=(LGPL-2.1-only)

_src_pkgname=libsx-mirror

source=("${_src_pkgname}-${pkgver}.tar.gz::https://github.com/shrik3/libsx-mirror/archive/refs/tags/2.08.tar.gz")
sha1sums=('15f99770db0fa18ffdb350507e6722f16e8c9d7e')

_src=${_src_pkgname}-${pkgver}
build() {
    cd ${_src}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${_src}
    make DESTDIR="$pkgdir" install
    # docs and license
    install -Dm644 "docs/html"/* -t "${pkgdir}/usr/share/doc/${pkgname}/html"
    install -Dm644 "docs/text"/* -t "${pkgdir}/usr/share/doc/${pkgname}/text"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
