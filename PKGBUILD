# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=exa-py
pkgname=python-$_name
pkgver=2.20.0
pkgrel=1
pkgdesc="Python SDK for Exa API."
arch=('any')
url="https://github.com/exa-labs/exa-py"
license=('MIT')
depends=('python' 'python-requests' 'python-typing_extensions' 'python-openai' 'python-pydantic' 'python-httpx' 'python-httpcore' 'python-dotenv')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14e0447cbd58ba3a0fdfb1b4edbc75401bf7edd1a72157a53b57e642a2afb218')

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
