# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=matlab-engine-for-python
pkgname=python-matlabengine
pkgver=9.14.2
pkgrel=1
pkgdesc='A module to call MATLAB from Python'
arch=(x86_64)
url='https://github.com/mathworks/matlab-engine-for-python'
license=('MIT')
depends=(matlab python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('7395d3b73a9f8d0422b4cd12ec90fcaeb221256d9f7905993d144dc21b42445ed8cacbb7c24272d274adca6d1991c7a30b52c5472f765d44fc8308a0d0fe5874')

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
