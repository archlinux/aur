# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=bm25s
pkgname=python-${_name}
pkgver=0.3.9
pkgrel=1
pkgdesc="An ultra-fast implementation of BM25 based on sparse matrices"
arch=('any')
url="https://github.com/xhluca/bm25s"
license=('MIT')
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('895c679d952b7de8355edb5f3e1a620a1e2f294d1d42b919bf0821cce2e2f597')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv test-env
  test-env/bin/pip install installer dist/*.whl --quiet
  test-env/bin/python -c "import bm25s; print('import OK')"
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
