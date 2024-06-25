# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.1.10
pkgrel=2
pkgdesc='A Python DB API 2.0 compliant API for access to MariaDB and MySQL databases'
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-python/"
license=('LGPL')
depends=('python>=3.8.0' 'mariadb-connector-c')
makedepends=('python-setuptools')
# https://downloads.mariadb.org/connector-python
# https://mariadb.com/downloads/connectors/connectors-data-access/python-connector
source=(
	"https://archive.mariadb.org/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz"
	"gcc14-const.patch"
)
sha512sums=(
	'9eb35494bce15cf2382e1d73c02e1ee87dd035b4cf1b98ab11b33c87d3349cde6e1548cc10000a00d7918c224a685a38249d8de1f1e4371b1be6d02b33a63c77'
	'd187e1baa014adeb0d431a3219718f0b64945cc52e0a90acfc4c3d33df6db830b010de111353b896d25dab48fbb2b3a2c76e73b396240b537fdcc1fb1bdea4c4'
)

build() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/gcc14-const.patch"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}
