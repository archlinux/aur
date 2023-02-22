# Maintainer: Philipp A. <flying-sheep@web.de>
_name=numcodecs
pkgname=python-numcodecs
pkgver=0.11.0
pkgrel=1
pkgdesc='A Python package providing buffer compression and transformation codecs for use in data storage and communication applications'
arch=(any)
url="https://github.com/zarr-developers/$_name"
license=(MIT)
depends=(python-numpy python-entrypoints python-msgpack)
makedepends=(cython python-py-cpuinfo python-setuptools python-setuptools-scm python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6c058b321de84a1729299b0eae4d652b2e48ea1ca7f9df0da65cb13470e635eb')

build() {
	cd "$_name-$pkgver"
	export CFLAGS="$CFLAGS -march=native"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
