# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-nncf
_pkgname=nncf
pkgver=3.2.0
pkgrel=1
pkgdesc="Neural Network Compression Framework for OpenVINO (quantization, pruning, sparsity)"
arch=('any')
url="https://github.com/openvinotoolkit/nncf"
license=('Apache-2.0')
depends=(
    'python'
    'python-networkx'
    'ninja'
    'python-numpy'
    'python-openvino-telemetry'
    'python-packaging'
    'python-psutil'
    'python-pydot'
    'python-rich'
    'python-safetensors'
    'python-scikit-learn'
    'python-scipy'
    'python-tabulate'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-pytorch: PyTorch backend for compression'
    'python-onnx: ONNX backend for compression'
    'openvino: OpenVINO backend and inference'
    # plots extra
    'python-matplotlib: plotting compression statistics'
    'python-pandas: tabular data for plots'
    'python-pillow: image handling for plots'
    'python-plotly: interactive plots (provides plotly.express)'
)
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/n/nncf/$_pkgname-$pkgver.tar.gz")
sha256sums=('5dd42d80d0dd8faa316cfb7773defc70f76d9be6e9829005904580391660f4db')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH="$PWD/src:$PYTHONPATH" python -c "import nncf; print(nncf.__version__)"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
