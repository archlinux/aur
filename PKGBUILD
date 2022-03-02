# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-base-app
pkgver=0.2.36
pkgrel=1
pkgdesc="Framework for Python apps with simple web frontend"
arch=('any')
url="https://github.com/marcus67/python_base_app"
license=('GPL3')
depends=(
	'python-alembic'
	'python-fakeldap'
	'python-flask'
	'python-flask-wtf'
	'python-flask-login'
	'python-jinja'
	'python-markupsafe'
	'python-dateutil'
	'python-google-speak'
	'python-ldap'
	'python-requests'
	'python-secure'
	'python-some-flask-helpers'
	'python-urllib3'
	'python-wtforms')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-coverage')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz"
        'remove-tests.patch')
sha256sums=('b0d75bbee0029a6235fa8f6dd139b449d56a0007325db81acb8c70fa61ba7963'
            '19e40dc0d994701eac4803457765e52cef4240ade0b6f1432818dd1d437454b0')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" < remove-tests.patch
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
