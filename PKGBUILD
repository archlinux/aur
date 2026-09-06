# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-semantic-conventions
pkgname=python-$_name
pkgver=0.1.35
pkgrel=1
pkgdesc="OpenInference Semantic Conventions."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/python/openinference-semantic-conventions"
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('b727c98033658653ca412f673cdf51f6da17648ee579428ced19a8a9cb72489c')

build() {
  cd "$srcdir"/${_name//-semantic-conventions/}-$pkgname-v$pkgver/python/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-semantic-conventions/}-$pkgname-v$pkgver/python/$_name
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-semantic-conventions/}-$pkgname-v$pkgver/python/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
