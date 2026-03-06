# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ddgs
pkgname=python-$_name
pkgver=9.11.2
pkgrel=1
pkgdesc="Dux Distributed Global Search. A metasearch library that aggregates results from diverse web search services."
arch=('any')
url="https://github.com/deedy5/ddgs"
license=('MIT')
depends=('python' 'python-click' 'python-primp' 'python-lxml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-fastapi: api' 'python-mcp: api' 'uvicorn: api' 'python-colorama: api' 'python-httptools: api' 'python-dotenv: api' 'python-pyyaml: api' 'python-uvloop: api' 'python-watchfiles: api' 'python-websockets: api')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('088614114eb5eeef501cc9eaa225884f3de0d3759e745a45c9c709e913ac68d3')

build() {
    cd "$srcdir"/$_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -k "not books and not images"
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
