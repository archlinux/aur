# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=skl2onnx
pkgname=python-skl2onnx
pkgver=1.19.1
pkgrel=1
pkgdesc='Convert scikit-learn models to ONNX'
arch=('any')
url='https://github.com/onnx/sklearn-onnx'
license=('Apache-2.0')
depends=(
    'python'
    'python-onnx'
    'python-scikit-learn'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    'python-numpy'
)
optdepends=(
    'python-pandas: for DataFrame type inference'
    'python-jinja: for ONNX operator code generation'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/onnx/sklearn-onnx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9487611004ccd9510cd657fa3b7dc1dff299a202dd977efcd3c616c87aeae338')

build() {
    cd "sklearn-onnx-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "sklearn-onnx-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import skl2onnx; print(f'skl2onnx version: {skl2onnx.__version__}')"
}

package() {
    cd "sklearn-onnx-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
