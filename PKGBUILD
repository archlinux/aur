# Maintainer: Philipp A. <flying-sheep@web.de>

_name=array-api-compat
pkgname=python-$_name
pkgver=1.9.1
pkgrel=1
pkgdesc='A wrapper around NumPy and other array libraries to make them compatible with the Array API standard.'
arch=(any)
url="https://data-apis.org/$_name/"
license=(MIT)
depends=(python)
optdepends=(python-numpy python-cupy python-jax python-pytorch python-dask python-sparse)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/data-apis/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('10c024689908b4c09cb0342859523f9521f614dc03570ce1e10536f4f1ba69a9')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
