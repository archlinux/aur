# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael R. Shannnon <mrshannon.aerospace@gmail.com>

pkgname=python-vex
_pkg="${pkgname#python-}"
pkgver=0.0.19
pkgrel=1
pkgdesc='Run commands in a virtualenv'
url='https://github.com/sashahart/vex'
arch=('any')
license=('MIT')
depends=('python-virtualenv')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/v/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('47c4f0cadf9eca2f6cb7c68ba443f31cb94d5a9b59654c9123d26aeaeae82aa8')

prepare() {
  cd "$_pkg-$pkgver"
  sed -i '/scripts=/d' setup.py
}

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
