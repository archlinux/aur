# Maintainer: Philipp A. <flying-sheep@web.de>

_name=tiledb
pkgname=python-$_name
pkgver=0.17.3
pkgrel=1
pkgdesc='Pythonic interface to the TileDB array storage manager'
arch=(x86_64)
url="https://github.com/TileDB-Inc/TileDB-Py"
license=(MIT)
_pyminor=10
# TODO: make it use system libmagic (file) and capnproto
depends=(capnproto aws-sdk-cpp spdlog "python>=3.$_pyminor" "python<3.$((_pyminor + 1))" 'python-numpy>=1.21' python-packaging)
makedepends=(git cmake pybind11 python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c934118162cfc4ab9967435f857fa724023b5b16d7a66e5fcc0d99cc46ed3662')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check  # wants setuptools<=59.5.0
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
