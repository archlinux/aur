# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-evaluate'
_pkgname=${pkgname#python-}
pkgver=0.4.4
pkgrel=1
pkgdesc='HuggigFace library for easily evaluating machine learning models and datasets'
arch=('any')
url='https://github.com/huggingface/evaluate'
license=('Apache-2.0')
depends=('python-datasets'
         'python-dill'
         'python-fsspec'
         'python-huggingface-hub'
         'python-multiprocess'
         'python-numpy'
         'python-packaging'
         'python-pandas'
         'python-requests'
         'python-scipy'
         'python-tqdm'
         'python-xxhash')
groups=('huggingface')
makedepends=('python-build' 'python-installer' 'python-packaging' 'python-setuptools')
optdepends=(
    'python-transformers: Transformers library support'
)
source=("evaluate-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce7e01669f22c1e6348dd99b0de43c0e886bf36e591e036f708d623a0ad2731d')

build() {
  python -m build -nw "${_pkgname}-${pkgver}"
}

check() {
  export PYTHONPATH="${srcdir}/${_pkgname}-${pkgver}/src"
  python -c 'import evaluate'
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir \
    dist/$_pkgname-$pkgver-*.whl
}
