# Maintainer: Philipp A. <flying-sheep@web.de>
_name=numcodecs
pkgname=python-numcodecs
pkgver=0.10.2
pkgrel=1
pkgdesc='A Python package providing buffer compression and transformation codecs for use in data storage and communication applications'
arch=(any)
url="https://github.com/zarr-developers/$_name"
license=(MIT)
depends=(python-numpy python-msgpack)
makedepends=(cython python-setuptools python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('22838c6b3fd986bd9c724039b88870057f790e22b20e6e1cbbaa0de142dd59c4')

build() {
	cd "$_name-$pkgver"
	export CFLAGS="$CFLAGS -march=native"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
