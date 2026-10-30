# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-instrumentation
pkgname=python-$_name
pkgver=0.1.74
pkgrel=1
pkgdesc="OpenInference instrumentation utilities."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/python/$_name"
license=('Apache-2.0')
depends=('python'
         'python-openinference-semantic-conventions'
         'python-opentelemetry-api'
         'python-opentelemetry-sdk'
         'python-wrapt')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-jsonschema'
              'python-openai'
              'python-pydantic'
              'python-pytest-asyncio'
              'python-pytest-recording')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('ca36aba45654b020a9516cb0e2cd9e64a89ee1a2ceee2c0e4950323d5f311580')

build() {
  cd "openinference-$pkgname-v$pkgver/python/$_name"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "openinference-$pkgname-v$pkgver/python/$_name"
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "openinference-$pkgname-v$pkgver/python/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
