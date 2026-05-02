# Maintainer: Will Handley <wh260@cam.ac.uk>

pkgname=python-pysolarmanv5
_pkgname=pysolarmanv5
pkgver=3.0.6
pkgrel=1
pkgdesc='Python library for interacting with Solarman (IGEN-Tech) v5 based solar data loggers'
arch=('any')
url='https://github.com/jmccrohan/pysolarmanv5'
license=('MIT')
depends=('python-umodbus')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ec3c6c03ec47bd0ee811f32ee4da272a28cc53141ab1113b5dbec55834c8afb5')

build() {
  cd "$_pkgname-$pkgver"
  python -m build -nw
}

check() {
  cd "$_pkgname-$pkgver"
  PYTHONPATH=$PWD python -c 'import pysolarmanv5'
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}
