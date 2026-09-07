# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=tavily
pkgname=python-$_name
pkgver=0.8.1
_commit=58ad657a99ed32e3d7b40972d984869b54dbd42f
pkgrel=1
pkgdesc="Python wrapper for the Tavily API."
arch=('any')
url="https://github.com/tavily-ai/tavily-python"
license=('MIT')
depends=('python' 'python-requests' 'python-tiktoken' 'python-httpx')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-typing_extensions')
source=("$_name::git+$url.git#commit=$_commit")
sha256sums=('51e4d60085129e000d77c6c4b3db2b0067d6d07d819cb2d7b56c764e82149866')

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
