# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: quietvoid <tcChlisop0@gmail.com>

_libname=npyosmium
pkgname="python-${_libname}"
pkgver=3.7.0
pkgrel=4
pkgdesc="Fork with numpy interface - Python bindings for libosmium, the data processing library for OSM data"
_rootdir="${_libname}-${pkgver}"
url="https://github.com/agrenott/npyosmium"
depends=('python' 'libosmium' 'pybind11')
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel' 'protozero')
license=('BSD')
arch=('x86_64')
source=("${_rootdir}.tar.gz::https://github.com/agrenott/npyosmium/archive/refs/tags/v${pkgver}.tar.gz"
		'010-cmake-3.5.patch')
sha256sums=('7a743099c10e67901abe004c526164a97dd399d6ced86878642245e77937e119'
			'1f0c2c9b4b089c7c312ce41fc236f0b03b15c77b8d94ad07a54639cab3073575')

prepare() {
    cd "${_rootdir}"
    patch -Np1 -i "${srcdir}/010-cmake-3.5.patch"
}

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
