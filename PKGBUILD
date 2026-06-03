# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-gepa
_pkgname=gepa
pkgver=0.0.27
pkgrel=1
pkgdesc="Optimize prompts, code, and more via reflective text evolution"
arch=('any')
url="https://github.com/gepa-ai/gepa"
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'python-litellm: for the full extra (LLM backends, AUR)'
    'python-datasets: for the full extra (dataset adapters)'
    'python-mlflow: for the full extra (experiment tracking, AUR)'
    'python-wandb: for the full extra (experiment tracking, AUR)'
    'python-tqdm: for the full extra (progress bars)'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('02ecb19e4aa6a1f5bb2994cd54b2057f25cd5e8cd662fee514303b2a8ba0a738')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH="$PWD/src:$PYTHONPATH" python -c "import gepa; print(getattr(gepa, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
