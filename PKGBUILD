# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-semantic-conventions
pkgname=python-$_name
pkgver=0.1.40
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
sha256sums=('0ab837674450775189d40b80675b228d82859df9e93b380170c7186d0e33efda')

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
