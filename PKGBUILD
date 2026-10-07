# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mnextend
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc="Additional functionality for MNE-Python"
arch=('any')
url="https://github.com/cbrnr/mnextend"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-edfio'
    'python-matplotlib'
    'python-mne'
    'python-numpy'
    'python-onnx'
    'python-pybv'
    'python-pybvrf'
    'python-pyxdf'
    'python-scipy'
)
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=(
    "https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
    'uv-build-0.12.10.patch'
)
sha256sums=('326bab5e1758f3826a91736b3e86cf679107924294549d0d6d5d7015482c5a07'
            '6a0dca6209fb08f679f8733b4cdf4c2711a97b90d18fda4b14f94c25dad8b569')

prepare() {
    cd "$srcdir/$_name-$pkgver"
    patch -Np1 -i "$srcdir/uv-build-0.12.10.patch"
}

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
