# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: peippo <christoph+aur@christophfink.com>

pkgname=python-tableschema
_name="${pkgname#python-}"
pkgdesc='Parse messy tabular data in various formats'
pkgver=1.20.2
pkgrel=1
url='https://github.com/frictionlessdata/tableschema-py'
arch=('any')
license=('MIT')
depends=(
	'python-click>=3.3'
	'python-dateutil>=2.4'
	'python-isodate>=0.5.4'
	'python-jsonschema>=2.5'
	'python-requests>=2.5'
	'python-rfc3986>=1.1.0'
	'python-six>=1.9'
	'python-tabulator>=1.51.3' ## AUR
)
makedepends=('python-setuptools')
# checkdepends=(
# 	'python-pytest-runner'
# 	'python-pytest-cov'
# 	'pylama'
# 	'python-mock'
# 	'python-cached-property'
# 	'python-xlrd')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cfa3b0aa1c0941002384c6288794f9488cb5ea9188cf84ac700d17758cb036e7')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

# check() {
# 	cd "$_name-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
