# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTooling'
pkgname=python-${_pkgname,,}
pkgver=2.4.0
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
sha256sums=('27888d2f0bd64d0ecbe58c395004509e62cb27a26f3ef68d16302131388dcac4')

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
