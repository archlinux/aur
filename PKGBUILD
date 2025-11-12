# Maintainer: Kino <cybao292261@163.com>

pkgname=python-ahrs
_pkgname=ahrs
pkgver=0.4.0
pkgrel=1
pkgdesc='Attitude and Heading Reference Systems in Python'
arch=('any')
url="https://github.com/Mayitzin/ahrs"
license=('MIT')
makedepends=(
  'python-wheel'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-hatchling'
)
depends=(
  'python-numpy'
  'python-scipy'
  'python-matplotlib'
)
checkdepends=('python-pytest')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Mayitzin/ahrs/archive/v${pkgver}.tar.gz")
sha256sums=('080e62c6cad232d2da343d219df728c5ca14f22dae9f53b5a7898fedbf32ee64')
b2sums=('88325af877c1df12dfebacb0715ca14a38107ac0f73e9b6f745e58f038e32f21457cb50e15cf1ec3441cc2291173239bd745f25d5eaed33f53b713cac8d9297d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPATH="$PWD:$PYTHONPATH" python -m pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-$_pkgname/LICENSE"
}
