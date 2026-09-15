# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-semantic-conventions
pkgname=python-$_name
pkgver=0.1.38
pkgrel=1
pkgdesc="OpenInference Semantic Conventions."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/${pkgname/-//}"
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('c916de9610b35848bbb38cf4a87910c3af06196da1dba4016421a442c11ea698')

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
