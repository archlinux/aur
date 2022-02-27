# Maintainer: Philipp A. <flying-sheep@web.de>

_name=anndata
pkgname=python-$_name
pkgver=0.7.8
pkgrel=3
pkgdesc='A data structure for rectangular numeric data and sample/variable annotations.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(BSD)
depends=(python-pandas python-scipy python-h5py python-natsort python-packaging python-xlrd)
makedepends=(python-flit-core python-setuptools-scm python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1efd7eb40839e0325bb066238280228a980d7dde6410793dbff2835f44a2d3ef')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check  # xlrd < 2 not available on arch
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
