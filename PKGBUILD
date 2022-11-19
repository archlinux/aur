# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-rerunfailures
pkgname=python38-pytest-rerunfailures
pkgver=10.2
pkgrel=5
pkgdesc="A plugin for py.test that re-runs failed tests to eliminate intermittent failures"
arch=(any)
url="https://github.com/pytest-dev/pytest-rerunfailures/"
license=(MPL2)
# NOTE: move python38-setuptools to makedepends with > 10.2
depends=(python38-pytest python38-setuptools)
makedepends=(python38-build python38-installer python38-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('8830610276e2cc172ee372ae4d8376bc6329138751ea2737a4def6af32d05c112c872a7a180ff554018058c05ed0d109927dbac61f748586257e40b0243f03c8')
b2sums=('9f317f3a39ac234e145a14d532d2727bb9fb5fead65c05372cf95268e0f589f9de994cd3c47e75dcb354c996595698c43fccdea5134d2e1921429c8ea7b71451')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES.rst,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
