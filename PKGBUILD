# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=tavily-python
pkgname=python-$_name
pkgver=0.8.4
_commit=01277b6301dd0945cbcec2212d5534e59d663d88
pkgrel=1
pkgdesc="Python wrapper for the Tavily API."
arch=('any')
url="https://github.com/tavily-ai/tavily-python"
license=('MIT')
depends=('python' 'python-requests' 'python-tiktoken' 'python-httpx')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-typing_extensions')
source=("$_name::git+$url.git#commit=$_commit")
sha256sums=('58195bf0ef6728bd4725ff9b6502a1dbfb0cfc4f1395407038131008d8dc88d1')

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
