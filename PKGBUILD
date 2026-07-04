# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=llama-index-llms-openai
pkgname=python-${_name}
pkgver=0.7.9
pkgrel=1
pkgdesc="llama-index llms openai integration"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
depends=('python' 'python-openai' 'python-llama-index-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f54a24b717134c86e724007057a06a84394f019d1f01e918b624894e208a86df')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv test-env
  test-env/bin/pip install installer dist/*.whl --quiet
  test-env/bin/python -c "from llama_index.llms.openai import OpenAI; print('import OK')"
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
