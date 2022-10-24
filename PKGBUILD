# Maintainer: Achmad Fathoni<fathoni(dot)id(at)gmail(dot)com>
pkgname=python-ouster-sdk
pkgver=0.5.1
_pkgver=20220927
pkgrel=3
pkgdesc="Ouster Python SDK"
arch=(any)
url="https://github.com/ouster-lidar/ouster_example"
license=('BSD')
makedepends=('python-setuptools' 'python-pytest' 'python-build' 'python-installer' 'pybind11' 'jsoncpp' 'cmake' 'eigen' 'python-wheel')
depends=('python' 'python-typing_extensions' 'libtins' 'python-numpy' 'glew' 'glfw-x11')
checkdepends=('python-tox')
source=(${url}/archive/refs/tags/${_pkgver}.tar.gz)
sha256sums=('2f5966f3780be01bda35d5be78f54a8fef7d529eb0e922b9fb29571f4a803264')
_dir=ouster_example-${_pkgver}/python

prepare() {
    cd ${srcdir}/${_dir}
    sed -i '4s/, "cmake==3.21.1"//' pyproject.toml
}

build() {
    cd ${srcdir}/${_dir}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_dir}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

check() {
    tox -c ${srcdir}/${_dir}
}
