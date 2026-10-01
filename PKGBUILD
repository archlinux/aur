# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=exa-py
pkgname=python-$_name
pkgver=2.24.0
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
sha256sums=('3d7aa13308325cdc5abc2716e0faf784584f03d6be9a5776353a1f14aca5d919')

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
