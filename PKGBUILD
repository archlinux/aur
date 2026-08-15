# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: graziano.giuliani <graziano.giuliani@gmail.com>
# Contributor: Rich Lindsley <rich at dranek dot com>

## GPG key: https://github.com/djhoese.gpg

pkgname=python-pyresample
pkgrel=1
pkgver=1.35.0
_commit=9c14be4
pkgdesc="Geospatial image resampling in Python"
arch=(x86_64)
license=(LGPL-3.0-or-later)
url="https://github.com/pytroll/pyresample"
depends=(
    python
    python-configobj
    python-donfig
    python-numpy
    python-platformdirs
    python-pykdtree
    python-pyproj
    python-shapely
    python-setuptools
    python-yaml)
optdepends=(
    'python-numexpr: used to optimize some bottlenecks'
    python-cartopy
    python-dask
    python-matplotlib
    python-rasterio
    python-xarray
    python-zarr)
makedepends=(
    cython
    git
    python-build
    python-installer
    python-versioneer
    python-wheel)
replaces=(pyresample)
source=("$pkgname::git+$url#commit=$_commit?signed"
        setup.py.patch)
sha256sums=('7e03bb4992189494fb6496993b6a1c66dc90ea3753f9debacce047e6db66e180'
            'e157817f007b65a4745025bbb5ba4cb310a8a5257870c1557a705252f98b9a2d')
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
    python -m installer --destdir="$pkgdir" dist/*.whl
}

