# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-semantic-conventions
pkgname=python-$_name
pkgver=0.1.44
pkgrel=2
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
sha256sums=('6e85765d42ce41be741d6a877809bc88e3ae651af5b2edddd3df0d3232a4d06c')

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
