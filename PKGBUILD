# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=requests-hawk
pkgname=python-requests-hawk
pkgver=1.2.1
pkgrel=2
pkgdesc='Hawk authentication strategy for the requests python library'
arch=('any')
url='https://github.com/mozilla-services/requests-hawk'
license=('Apache-2.0')
depends=('python-mohawk' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/mozilla-services/$_pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9259bb0cb7be376e87708ad1535865ede4255072b3382d7119e8974072bb6b71')

prepare() {
  sed -e 's|assertEquals|assertEqual|' -i $_pkgname-$pkgver/requests_hawk/tests/test_hawkauth.py # Fix test with python 3.12
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m unittest -v
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
