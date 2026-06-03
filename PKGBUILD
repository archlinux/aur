# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-numpyro
_pkgname=numpyro
pkgver=0.21.0
pkgrel=1
pkgdesc="Probabilistic programming with NumPy powered by JAX for autograd and JIT compilation to GPU/TPU/CPU"
arch=('any')
url="https://github.com/pyro-ppl/numpyro"
license=('Apache-2.0')
depends=(
    'python'
    'python-numpy'
    'python-tqdm'
    'python-jax'
    'python-jaxlib'
    'python-multipledispatch'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fc4a90a024a08840868d46b5f9bdc416dfa3ab76c61691036b44ac2b8a77ac77')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import numpyro; print(getattr(numpyro, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
