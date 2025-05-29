# Maintainer: quietvoid <tcChlisop0@gmail.com>

_libname=pybind11-rdp
pkgname="python-${_libname}"
pkgver=0.1.5
pkgrel=1
pkgdesc='C++ implementation of the Ramer-Douglas-Peucker algorithm (binding to python via pybind11)'
_rootdir="${_libname}-${pkgver}"
arch=('x86_64')
url='https://github.com/cubao/pybind11-rdp'
license=('BSD')
depends=('python-numpy')
makedepends=('git' 'cmake' 'python-build' 'python-installer' 'python-wheel' 'python-scikit-build-core')
provides=('python-pybind11-rdp')
conflicts=('python-pybind11-rdp')
source=("${_rootdir}::git+https://github.com/cubao/pybind11-rdp.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${_rootdir}"
    git submodule update --init --recursive
}

build() {
    cd "${_rootdir}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
