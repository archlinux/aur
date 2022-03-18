# Maintainer: Philipp A. <flying-sheep@web.de>
_name=zarr
pkgname=python-zarr
pkgver=2.11.1
pkgrel=1
pkgdesc='An implementation of chunked, compressed, N-dimensional arrays for Python'
arch=(any)
url='https://github.com/zarr-developers/zarr-python'
license=(MIT)
depends=(python-asciitree python-numpy python-fasteners 'python-numcodecs>=0.6.4')
makedepends=(python-setuptools python-setuptools-scm python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('11b628f42dec36e0147879e8bd471524b59b238094b9b21e3c35be78399c115e')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check  # xlrd < 2 not available on arch
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
