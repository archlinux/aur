# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: peippo <christoph+aur@christophfink.com>

pkgname=python-tabulator
pkgver=1.53.5
pkgrel=1
pkgdesc='Python library for reading and writing tabular data via streams'
arch=('any')
license=('MIT')
url='https://github.com/frictionlessdata/tabulator-py'
depends=(
	'python-boto3>=1.9'
	'python-chardet>=3.0'
	'python-click>=6.0'
	'python-ijson>=3.0.3'
	'python-jsonlines>=1.1'
	'python-linear-tsv>=1.0'
	'python-openpyxl>=2.6'
	'python-requests>=2.8'
	'python-six>=1.9'
	'python-sqlalchemy>=0.9.6'
	'python-unicodecsv>=0.14')
makedepends=('python-setuptools')
# checkdepends=('python-pytest' 'python-pytest-cov' 'python-mock' 'pylama' 'python-moto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cd357ed6cbca2622e7afb71d0af48df2d973cf4c9b30da4a1c641855a3a827ea')

prepare() {
	cd "tabulator-py-$pkgver"
	sed -i '/PACKAGES/s/tests/tests*/' setup.py
}

build() {
	cd "tabulator-py-$pkgver"
	python setup.py build
}

# check() {
# 	cd "tabulator-py-$pkgver"
# 	pytest -m 'not remote'
# }

package() {
	cd "tabulator-py-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
