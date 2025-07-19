# Maintainer: crl <crl18039102576@126.com>

pkgname=python-pynvjitlink
pkgver=0.7.0
pkgrel=1
pkgdesc="nvJitLink Python binding"
url="https://github.com/rapidsai/pynvjitlink"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'python')
makedepends=('python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "dynamic-lib.patch")
sha256sums=(
    '350abe5e45a9f137c947f8cd06095a02c982689e1ed174e4d9bd06ba675268ca'
    '56bdc91c0d769efed7e99bb36dd5168943e554d728a174e64e8b896f90c50444'
)

prepare() {
    cd "$srcdir/pynvjitlink-$pkgver"
    patch -p1 CMakeLists.txt < "$srcdir/dynamic-lib.patch"
}

build() {
    cd "$srcdir/pynvjitlink-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/pynvjitlink-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
