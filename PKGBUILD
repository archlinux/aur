# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-semantic-conventions
pkgname=python-$_name
pkgver=0.1.43
pkgrel=1
pkgdesc="OpenInference Semantic Conventions."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/${pkgname/-//}"
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('effac920b3a33283ad9da08c4af2c732e67fdde7ce87f2990f332920f1615c37')

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
