# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=matlab-engine-for-python
pkgname=python-matlabengine
pkgver=9.14.3
pkgrel=1
pkgdesc='A module to call MATLAB from Python'
arch=(x86_64)
url='https://github.com/mathworks/matlab-engine-for-python'
license=('MIT')
depends=(matlab python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('491f56fad8007a943b33b9daebcba4a61ca007d93151eaa65394439d4ca9ef1745d4b28e5a41b6dea858da36ecbdaba07b1a6ac0005ebc6373abdc06f3f7fa7e')

build() {
    cd $_name-$pkgver
    _malabroot=$(matlab -nodisplay -nojvm -batch "matlabroot" | grep -Eo "/.*[^']")
    export LD_LIBRARY_PATH=$_matlabroot/bin/glnxa64
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
