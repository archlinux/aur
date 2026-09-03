# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=phonic
pkgname=python-$_name
pkgver=0.32.26
pkgrel=1
pkgdesc='The Phonic Python library provides convenient access to the Phonic APIs from Python.'
arch=('any')
url='https://github.com/Phonic-Co/phonic-python'
license=('MIT')
depends=('python' 'python-httpx' 'python-pydantic' 'python-pydantic-core' 'python-typing_extensions' 'python-websockets')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-xdist' 'python-dateutil')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25f7c13e3a023a1116b6dbf0dcfff266084740cdee309cd02eb302065be84bd9')

build() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-python-$pkgver
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
