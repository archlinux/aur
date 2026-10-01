# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=exa-py
pkgname=python-$_name
pkgver=2.23.0
pkgrel=1
pkgdesc="Python SDK for Exa API."
arch=('any')
url="https://github.com/exa-labs/exa-py"
license=('MIT')
depends=('python'
         'python-requests'
         'python-typing_extensions'
         'python-openai'
         'python-pydantic'
         'python-httpx'
         'python-httpcore'
         'python-dotenv')
makedepends=('python-poetry-core'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-pytest-mock')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f19322aab2def03d73cc68ba78ab609874a35f307ef262011b2b113b191905e')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
