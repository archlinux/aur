# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=matlab-engine-for-python
pkgname=python-matlabengine
pkgver=9.13.7
pkgrel=2
pkgdesc='A module to call MATLAB from Python'
arch=(x86_64)
url='https://github.com/mathworks/matlab-engine-for-python'
license=('MIT')
depends=(matlab python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('a2ecd7369442933f16a2f1e1c27ab1aae4d050087b8446e2e48e1b0122740b285040f3c8db9fb7ebca586823c2255c18a0ef235140148b5c48c0a120db5e6690')

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
