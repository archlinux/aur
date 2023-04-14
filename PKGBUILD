# Maintainer: Achmad Fathoni<fathoni(dot)id(at)gmail(dot)com>
pkgname=python-ouster-sdk
pkgver=20230403
pkgrel=1
pkgdesc="Ouster Python SDK"
arch=(any)
url="https://github.com/ouster-lidar/ouster_example"
license=('BSD')
makedepends=('python-setuptools' 'python-pytest' 'python-build' 'python-installer' 'pybind11' 'jsoncpp' 'cmake' 'eigen' 'python-wheel')
depends=('python' 'python-typing_extensions' 'libtins' 'python-numpy' 'glew' 'glfw-x11' 'spdlog')
checkdepends=('python-tox')
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('414a8118fb5cecfdfd0f8e72b27eca56456b99fc752325c7351dca2846ef0aca')
_dir=ouster_example-${pkgver}/python

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
