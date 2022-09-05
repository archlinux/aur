# Maintainer: Philipp A. <flying-sheep@web.de>

_name=anndata
pkgname=python-$_name
pkgver=0.8.0
pkgrel=1
pkgdesc='A data structure for rectangular numeric data and sample/variable annotations.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(BSD)
depends=(python-pandas python-scipy python-h5py python-natsort python-packaging)
makedepends=(python-flit-core python-setuptools-scm python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('94d2cc6f76c0317c0ac28564e3092b313b7ad19c737d66701961f3e620b9066e')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check  # xlrd < 2 not available on arch
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
