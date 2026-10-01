# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-semantic-conventions
pkgname=python-$_name
pkgver=0.1.41
pkgrel=1
pkgdesc="OpenInference Semantic Conventions."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/${pkgname/-//}"
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-pytest')
source=("$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('0ea8c1be262c9c75812367802d2cf33ee21b7d9b30b1f63b6ed169e8abbbd584')

build() {
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//}
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
