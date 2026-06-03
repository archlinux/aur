# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-fla-core
_pkgname=fla_core
_module=fla
pkgver=0.5.0
pkgrel=1
pkgdesc="Core operations for flash-linear-attention"
arch=('any')
url="https://github.com/fla-org/flash-linear-attention"
license=('MIT')
depends=(
    'python'
    'python-pytorch'
    'python-einops'
    'python-triton'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('476dd94711702af81cc4827010d9209f6053d8cdceac8e43d3c8497071f07a81')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import $_module; print(getattr($_module, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
