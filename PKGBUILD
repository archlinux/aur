# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=tavily-python
pkgname=python-$_name
pkgver=0.8.3
_commit=01c9182c098d32b7db5d2b5ce4ba5f3eaec99553
pkgrel=1
pkgdesc="Python wrapper for the Tavily API."
arch=('any')
url="https://github.com/tavily-ai/tavily-python"
license=('MIT')
depends=('python' 'python-requests' 'python-tiktoken' 'python-httpx')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-typing_extensions')
source=("$_name::git+$url.git#commit=$_commit")
sha256sums=('07e08b3094288a77ebaffa81cd2a0de27f5ae8a0534243a8b1fee5fbf9acfcb0')

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
