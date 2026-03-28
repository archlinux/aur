# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ddgs
pkgname=python-$_name
pkgver=9.12.0
pkgrel=1
pkgdesc="Dux Distributed Global Search. A metasearch library that aggregates results from diverse web search services."
arch=('any')
url="https://github.com/deedy5/ddgs"
license=('MIT')
depends=('python' 'python-click' 'python-primp' 'python-lxml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-fastapi: api' 'python-mcp: api' 'uvicorn: api' 'python-colorama: api' 'python-httptools: api' 'python-dotenv: api' 'python-pyyaml: api' 'python-uvloop: api' 'python-watchfiles: api' 'python-websockets: api' 'python-mcp: mcp')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a92a01079786590c731e4b7b75cb8c9c77b476a0b03bf6a058a4bbc4b53b9e2a')

build() {
    cd "$srcdir"/$_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -k "not images"
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
