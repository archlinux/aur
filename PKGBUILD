# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-sdk
pkgname=python-$_name
pkgver=0.3.15
pkgrel=1
pkgdesc="SDK for interacting with LangGraph API."
arch=('any')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/sdk-py"
license=('MIT')
depends=('python' 'python-httpx' 'python-orjson' 'python-typing_extensions')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-pydantic')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('29e805003d2c6e296823dd71992610976fd0428cefaa8b3304fd91f2247037de')

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
