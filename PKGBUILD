# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=python-pyjavaproperties
_pkg=pyjavaproperties
pkgver=0.7
pkgrel=1
pkgdesc="Python replacement for java.util.Properties"
arch=('any')
url="https://pypi.python.org/pypi/pyjavaproperties"
license=('PSF')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('adb59893874ee14f12f9e9054fdd3e9383eb0071c22c596a377bf7585ef0ea85')

prepare() {
  cd "$_pkg-$pkgver"
  sed -i '/package/d' setup.py
}

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkg-$pkgver"
  pytest -x --disable-warnings
}

package() {
  cd "$_pkg-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
