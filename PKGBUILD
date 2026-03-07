# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-base-app
pkgver=0.2.45
pkgrel=1
pkgdesc="Framework for Python apps with simple web frontend"
arch=('any')
url="https://github.com/marcus67/python_base_app"
license=('GPL-3.0-or-later')
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
sha256sums=('2a491295ad00d8421688148b546deabb5745f83e4980db753bea6c73704f8a51'
            '19e40dc0d994701eac4803457765e52cef4240ade0b6f1432818dd1d437454b0')

prepare() {
    patch -p1 -d "$pkgname-$pkgver" < remove-tests.patch
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}
