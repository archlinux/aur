# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=phonic
pkgname=python-$_name
pkgver=0.32.43
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
sha256sums=('5f57bf34a7a8e20beba25cca9847d18a91b71dc5f23b91dd0fac31c219ee008f')

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
