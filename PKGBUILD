# Maintainer: Philipp A. <flying-sheep@web.de>

_name=array-api-compat
pkgname=python-$_name
pkgver=1.15.0
pkgrel=1
pkgdesc='A wrapper around NumPy and other array libraries to make them compatible with the Array API standard.'
arch=(any)
url="https://data-apis.org/$_name/"
license=(MIT)
depends=(python)
optdepends=(python-numpy python-cupy python-jax python-pytorch python-dask python-sparse)
makedepends=(meson-python python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('53c5f922491bf15f62847afafc4e39eedfae57d218988fefb8cce39c2a9b3dea')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
