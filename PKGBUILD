# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-onnx2torch
_pkgname=onnx2torch
pkgver=1.5.15
pkgrel=1
pkgdesc='ONNX to PyTorch converter'
arch=('any')
url='https://github.com/ENOT-AutoDL/onnx2torch'
license=('Apache-2.0')
depends=(
    'python'
    'python-numpy'
    'python-onnx'
    'python-pytorch'
    'python-torchvision'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    'python-onnxruntime'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/ENOT-AutoDL/onnx2torch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b27ead2afcdaa5d3c77bcd0e758efbdcfe07c4895f8b1fd8459309ee83c39f66')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    # Simple import test - full test suite requires downloading models
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "from onnx2torch import convert; print('Import successful')"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
