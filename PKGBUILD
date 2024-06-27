# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.1.10
pkgrel=3
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
	'05641e3716c7a263c9981a19fd34f65532f24dd51579104deb6ea05e00e52280f9b87c2b22c65054b29536e6d1af5da7f12396225f7a5ee637df1812fb88562d'
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
