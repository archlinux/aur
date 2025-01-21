# Maintainer: Philipp A. <flying-sheep@web.de>

_name=array-api-compat
pkgname=python-$_name
pkgver=1.10.0
pkgrel=1
pkgdesc='A wrapper around NumPy and other array libraries to make them compatible with the Array API standard.'
arch=(any)
url="https://data-apis.org/$_name/"
license=(MIT)
depends=(python)
optdepends=(python-numpy python-cupy python-jax python-pytorch python-dask python-sparse)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('eb98056fa4993e7e98860b7a1ca73c9ae1c77f1ef95366a5ebd5dec8e6d55bad')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
