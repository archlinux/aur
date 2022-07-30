# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor graziano.giuliani <graziano.giuliani@gmail.com>
# Contributor: Rich Lindsley <rich at dranek dot com>

## GPG key: https://github.com/djhoese.gpg

pkgname=pyresample
pkgrel=1
pkgver=1.25.0
_commit=93df018
pkgdesc="Geospatial image resampling in Python"
arch=('x86_64')
license=('LGPL3')
url="https://github.com/pytroll/pyresample"
depends=(
	'python>=3.8'
	'python-configobj'
	'python-numpy'
	'python-pykdtree'
	'python-pyproj'
	'python-setuptools'
	'python-yaml')
optdepends=(
	'python-numexpr: used to optimize some bottlenecks'
  'python-cartopy'
  'python-dask'
  'python-matplotlib'
  'python-rasterio'
  'python-shapely'
  'python-xarray'
  'python-zarr')
makedepends=(
	'cython'
	'git'
	'python-build'
	'python-installer'
	'python-oldest-supported-numpy'
	'python-versioneer-518'
	'python-wheel')
provides=('python-pyresample')
source=("$pkgname::git+$url#commit=$_commit?signed"
        'setup.py.patch')
sha256sums=('SKIP'
            'f51c28743db217f124f33c42334a97cc86d01cd9a96728f67ca3c05de39042f9')
validpgpkeys=('0CEE1C80170AEA74FEEF700DD0DB5057C9F9D380') ## David Hoese

prepare() {
	patch -p1 -d "$pkgname" < setup.py.patch
	sed -i "s/\$PKGVER/$pkgver/" "$pkgname/setup.py"
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
