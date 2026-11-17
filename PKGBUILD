# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-semantic-conventions
pkgname=python-$_name
pkgver=0.1.46
pkgrel=1
pkgdesc="OpenInference Semantic Conventions."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/python/$_name"
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('53b8c6c53bef220d3b6c86aecf5af00ca53f2f8dabc5905ad9b2b11a05101b35')

build() {
  cd "${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//}"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//}"
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
