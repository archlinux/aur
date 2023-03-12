# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTooling'
pkgname=python-${_pkgname,,}
pkgver=3.0.0
pkgrel=1
pkgdesc="A powerful collection of arbitrary useful classes, decorators, meta-classes and exceptions"
arch=(any)
url="https://github.com/pyTooling/$_pkgname"
license=('Apache')
depends=('python' 'python-ruamel-yaml' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=(
	'python-pytest-benchmark'
	'python-pytest'
	'python-anytree'
	'python-itertree'
	'python-numpy'
)
replaces=('python-pytooling-packaging' 'python-pymetaclasses' 'python-pyexceptions')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0d6ddcb3703f1230f33afb8470401d74044a15c87fc40121d1eb1fda32eac50a')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_pkgname-$pkgver"
  # testsuite runs performance tests for 5 minutes
  #pytest tests/
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
