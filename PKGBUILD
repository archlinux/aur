# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-fakeldap
pkgver=0.6.4
pkgrel=1
pkgdesc="LDAPObject implementation for mocking LDAP servers"
arch=('any')
url="https://github.com/zulip/fakeldap"
license=('BSD')
depends=('python-ldap')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose' 'python-coverage')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/fakeldap/fakeldap-$pkgver.tar.gz")
sha256sums=('ac5ff6431998c080b7d94a5190dd6e1ba8e48bbcf19e9360669855950886e12b')

build() {
	cd "fakeldap-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "fakeldap-$pkgver"
	nosetests
}

package() {
	export PYTHONHASHSEED=0
	cd "fakeldap-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
