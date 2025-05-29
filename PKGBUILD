# Maintainer: Philipp A. <flying-sheep@web.de>

_name=tiledb
pkgname=python-$_name
pkgver=0.34.0
pkgrel=1
pkgdesc='Pythonic interface to the TileDB array storage manager'
arch=(x86_64)
url="https://github.com/TileDB-Inc/TileDB-Py"
license=(MIT)
_pyminor=10
# TODO: make it use system libmagic (file) and capnproto
depends=(capnproto aws-sdk-cpp spdlog python-numpy python-packaging)
makedepends=(cython pybind11 python-scikit-build-core python-setuptools-scm python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ce4995f7455bebfa651fa45a795b07e8bc79867a6feb9b8523c8066ac817e44c')

build() {
	cd "$_name-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
