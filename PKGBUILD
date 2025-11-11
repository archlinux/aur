# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ddgs
pkgname=python-$_name
pkgver=9.9.0
pkgrel=1
pkgdesc="Dux Distributed Global Search. A metasearch library that aggregates results from diverse web search services."
arch=('any')
url="https://github.com/deedy5/ddgs"
license=('MIT')
depends=('python' 'python-click' 'python-primp' 'python-lxml' 'python-httpx' 'python-h2' 'python-socksio' 'python-brotli' 'python-brotli')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-dependency')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6e192b6d11b35b76f6677c748036709fc48e287720a9e315b654e1933406340b')

build() {
    cd "$srcdir"/$_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
