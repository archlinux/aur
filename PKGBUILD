# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=graphrag-common
pkgname=python-${_name}
pkgver=3.1.0
pkgrel=1
pkgdesc="Common utilities and types for GraphRAG"
arch=('any')
url="https://github.com/microsoft/graphrag"
license=('MIT')
depends=('python' 'python-dotenv' 'python-yaml' 'python-toml')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('cb76b46820d7d2443b431be4172a1a4fd485309538a17aade30081d5393b7276')

build() {
    cd "${srcdir}"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m venv test-env
  test-env/bin/pip install installer dist/*.whl --quiet
  test-env/bin/python -c "import graphrag_common; print('import OK')"
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
