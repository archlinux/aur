# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=phonic
pkgname=python-$_name
pkgver=0.33.6
pkgrel=1
pkgdesc='The Phonic Python library provides convenient access to the Phonic APIs from Python.'
arch=('any')
url='https://github.com/Phonic-Co/phonic-python'
license=('MIT')
depends=('python'
         'python-httpx'
         'python-pydantic'
         'python-pydantic-core'
         'python-typing_extensions'
         'python-websockets')
makedepends=('python-poetry-core'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-pytest-xdist'
              'python-dateutil')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1fdd2436797f74fd72688b32f97c6e03d498d7ebd02882a2a32f243acb2f705')

build() {
  cd "$_name-python-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-python-$pkgver"
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
