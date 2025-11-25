# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: quietvoid <tcChlisop0@gmail.com>

_libname=npyosmium
pkgname="python-${_libname}"
pkgver=4.2.0
pkgrel=1
pkgdesc="Fork with numpy interface - Python bindings for libosmium, the data processing library for OSM data"
_rootdir="${_libname}-${pkgver}"
url="https://github.com/agrenott/npyosmium"
depends=('python' 'libosmium' 'pybind11')
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel' 'protozero')
license=('BSD')
arch=('x86_64')
source=("${_rootdir}.tar.gz::https://github.com/agrenott/npyosmium/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0233fd99c1ca6c237764692e63d62dbd3de0872135c5ee75d90111a0665652990e0794971fc5c7799f2c5de555f748c74fd99cc319ee9553fa1177e8e01b81c6')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
