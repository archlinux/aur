# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: quietvoid <tcChlisop0@gmail.com>

_libname=npyosmium
pkgname="python-${_libname}"
pkgver=3.7.0
pkgrel=1
pkgdesc="Fork with numpy interface - Python bindings for libosmium, the data processing library for OSM data"
_rootdir="${_libname}-${pkgver}"
url="https://github.com/agrenott/npyosmium"
depends=('python' 'libosmium' 'pybind11')
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel' 'protozero')
license=('BSD')
arch=('x86_64')
source=("${_rootdir}.tar.gz::https://github.com/agrenott/npyosmium/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7559d1d0af07c8177aff38f5bcc344740764911494eb8227468dfb7a9a0f9e38')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
