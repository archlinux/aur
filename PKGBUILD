# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>

_name=llm-ollama
pkgname="python-${_name}"
pkgver=0.17.1
pkgrel=1
pkgdesc="LLM plugin providing access to models running on an Ollama server"
arch=("any")
url="https://github.com/taketwo/llm-ollama"
license=("Apache-2.0")
depends=("python" "python-llm" "python-ollama" "python-pydantic")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/taketwo/llm-ollama/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('532c2b1564be9f41c32366eb0f5208df437d4e2ab2e6af478ccf7bdb5ea41988')

latestver() {
  gh api repos/taketwo/llm-ollama/releases/latest --jq '.tag_name'
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
