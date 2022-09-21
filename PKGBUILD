# Maintainer: Achmad Fathoni<fathoni(dot)id(at)gmail(dot)com>
pkgname=python-ouster-sdk
pkgver=0.5.1
_pkgver=20220826
pkgrel=2
pkgdesc="Ouster Python SDK"
arch=(any)
url="https://github.com/ouster-lidar/ouster_example"
license=('BSD')
makedepends=('python-setuptools' 'python-pytest' 'pybind11' 'jsoncpp' 'cmake' 'eigen' 'python-wheel')
depends=('python' 'python-typing_extensions' 'libtins' 'python-numpy' 'glew' 'glfw-x11')
source=(${url}/archive/refs/tags/${_pkgver}.tar.gz)
sha256sums=('d25ee787a95eba937a0b7c30f455a0f9513a9cd13316184b15f2a36856bd9749')
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
    pytest ${srcdir}/${_dir}/tests 
}
