# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=exa-py
pkgname=python-$_name
pkgver=2.25.0
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
sha256sums=('a6ef725856f3e265a3a2ab0e17e1ccac05005a0bafd1a735873df7422eb9a414')

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
