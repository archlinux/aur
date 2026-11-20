# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-instrumentation
pkgname=python-$_name
pkgver=0.1.81
pkgrel=1
pkgdesc="OpenInference instrumentation utilities."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/python/$_name"
license=('Apache-2.0')
depends=('python'
         'python-opentelemetry-api'
         'python-opentelemetry-sdk'
         'python-openinference-semantic-conventions'
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
sha256sums=('36626f40d50acfc36dc90afaacb4cee4035f0606a2a405c5e4d4c25103b56df8')

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
