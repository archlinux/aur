# Maintainer: crl <crl18039102576@126.com>

pkgname=python-dask-cuda
_pkgname=dask-cuda
pkgver=25.06.00
pkgrel=1
pkgdesc="Utilities for Dask and CUDA interactions"
url="https://github.com/rapidsai/dask-cuda"
arch=('x86_64')
license=('Apache-2.0')
depends=(
    'python-dask'
    'python-distributed'
    'python-click'
    'python-numpy'
    'python-numba' 
    'python-pandas'
    'python-zict'
    'python-pynvml'
)
makedepends=('python-setuptools' 'python-scikit-build-core' 'python-rapids-build-backend')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
)
sha256sums=(
    'a1026ce6c5936912b10384919b445c9c7472faf270d70d97608e7e7de6477388'
)

# prepare() {
#     cd "$srcdir/$pkgbase-$pkgver"
#     patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
#     patch -p1 "cpp/src/common/cumlHandle.hpp" < "$srcdir/missing-include.patch"
#     patch -p1 "python/cuml/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
# }


build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
