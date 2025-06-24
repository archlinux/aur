# Maintainer: crl <crl18039102576@126.com>

pkgname=python-pynvjitlink
pkgver=0.6.0
pkgrel=1
pkgdesc="nvJitLink Python binding"
url="https://github.com/rapidsai/pynvjitlink"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'python')
makedepends=('python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(
    '44cf5d3d7082b0ce54a06591e22f2cb7dcd1fd54bc654bdf96ad14c5c922868d'
)


# prepare() {
#     cd "$srcdir/pynvjitlink-$pkgver"
#     patch -p1 "python/cudf/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
# }


build() {
    cd "$srcdir/pynvjitlink-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/pynvjitlink-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
