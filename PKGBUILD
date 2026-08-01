# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: quietvoid <tcChlisop0@gmail.com>

_libname=npyosmium
pkgname="python-${_libname}"
pkgver=4.3.1
pkgrel=1
pkgdesc="Fork with numpy interface - Python bindings for libosmium, the data processing library for OSM data"
_rootdir="${_libname}-${pkgver}"
url="https://github.com/agrenott/npyosmium"
depends=('python' 'libosmium' 'pybind11')
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel' 'protozero')
license=('BSD')
arch=('x86_64')
source=("${_rootdir}.tar.gz::https://github.com/agrenott/npyosmium/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('216f35fb9906d171571dd45ed36e3374abff9c6da8bda64a32c0a4e2a1937160de55f8143c1fd210f769d1e72dae4d49ee01d904cefdb41fcf35ee44a1303b14')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
