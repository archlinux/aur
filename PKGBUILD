# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-flash-linear-attention
_pkgname=flash_linear_attention
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast linear attention models and layers (high-level fla package)"
arch=('any')
url="https://github.com/fla-org/flash-linear-attention"
license=('MIT')
depends=(
    'python'
    'python-fla-core'
    'python-transformers'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'python-tilelang: tilelang extra'
    'python-causal-conv1d: conv1d extra (causal-conv1d>=1.4.0)'
    'python-matplotlib: benchmark extra'
    'python-datasets: benchmark extra (datasets>=3.3.0)'
    'python-pytest: test extra'
)
source=("https://files.pythonhosted.org/packages/source/f/flash-linear-attention/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('22b789a47f07738b4382ecdf775d7bb40e0d803c467c34f8e2ecd6a1dc780938')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import fla; print(getattr(fla, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
