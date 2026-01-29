# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-checkpoint-sqlite
pkgname=python-$_name
pkgver=3.0.3
pkgrel=1
pkgdesc="Library with a SQLite implementation of LangGraph checkpoint saver."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint-sqlite"
depends=('python' 'python-langgraph-checkpoint' 'python-aiosqlite' 'python-sqlite-vec')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-pytest-rerunfailures')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('438c234d37dabda979218954c9c6eb1db73bee6492c2f1d3a00552fe23fa34ed')

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -p "no:flaky"
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
