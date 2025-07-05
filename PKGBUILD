# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.1.12
pkgrel=2
pkgdesc='A Python DB API 2.0 compliant API for access to MariaDB and MySQL databases'
arch=('x86_64')
url="https://mariadb.com/kb/en/mariadb-connector-python/"
license=('LGPL')
depends=('python>=3.9.0' 'mariadb-connector-c')
makedepends=('python-setuptools')
# https://downloads.mariadb.org/connector-python
# https://mariadb.com/downloads/connectors/connectors-data-access/python-connector
source=(
	"https://archive.mariadb.org/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz"
)
sha512sums=(
	'26b76943ce35ac99942c570125d0eb3fba1ff8a0bf8a07a7534892c6459da1cc0132855105fcee0799491e600588207374111a479cb8cefe9a3e7b4ce7c16bba'
)

build() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	export CFLAGS+=" -Wno-error=incompatible-pointer-types"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}
