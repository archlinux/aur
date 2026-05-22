# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-checkpoint-conformance
pkgname=python-$_name
pkgver=0.0.2
pkgrel=1
pkgdesc="Conformance test suite for LangGraph checkpointer implementations."
arch=('any')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint-conformance"
license=('MIT')
depends=('python' 'python-langgraph-checkpoint')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('6718e00937bf2f04cdfd2cdfabea23e1dabb79a534ff4c127f305f6b40dad4e0')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
