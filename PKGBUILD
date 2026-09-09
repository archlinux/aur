# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-semantic-conventions
pkgname=python-$_name
pkgver=0.1.36
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
sha256sums=('0e4033ce1235c096715b320fcafbe14770edf3da1cb1efdd2ffd7a85ca2c378d')

build() {
  cd "$srcdir"/${_name//-semantic-conventions/}-$pkgname-v$pkgver/${pkgname/-//}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-semantic-conventions/}-$pkgname-v$pkgver/${pkgname/-//}
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-semantic-conventions/}-$pkgname-v$pkgver/${pkgname/-//}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
