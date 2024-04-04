# Maintainer: Sebastian Mark <smark+aur@posteo.net>
# Contributor: Dan Beste <Dan.Ray.Beste@gmail.com>
# Contributor: Bluewind

pkgname=python-pyzabbix
_pkgname=${pkgname#python-}
pkgver=1.3.1 # renovate: datasource=github-releases depName=lukecyca/pyzabbix
pkgrel=1
pkgdesc="Python Zabbix API"
arch=(any)
url="https://github.com/lukecyca/pyzabbix"
license=(LGPL2.1)
depends=(
	python
	python-packaging
	python-requests
)
makedepends=(
	python-build
	python-installer
	python-setuptools
	python-wheel
)
source=(${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('eb49964d7265dcc650f01c3b2ff3fcee9567c6def3471a6c8981a523de7791f00cf7f049b11daf2aab19af626682f9ff60ae9d7cc71d9b4c3b97149edbfa8840')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir "$pkgdir" dist/*.whl
}
