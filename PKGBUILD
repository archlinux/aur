# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pfm <vorticity at mail dot ru>

pkgname=python-txacme
pkgver=0.9.3
pkgrel=3
pkgdesc="ACME protocol implementation for Twisted"
url='https://github.com/twisted/txacme'
license=('MIT')
arch=('any')
depends=(
	'python-acme'
	'python-attrs'
	'python-eliot'
	'python-idna'
	'python-josepy'
	'python-pem'
	'python-pyopenssl'
	'python-service-identity'
	'python-treq'
	'python-twisted'
	'python-txsni')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=(
# 	'python-pytest'
# 	'python-fixtures'
# 	'python-hypothesis'
# 	'python-testrepository'
# 	'python-testscenarios'
# 	'python-testtools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/txacme/txacme-$pkgver.tar.gz")
sha256sums=('bce2d0dfa8fa2cf3f2eb10526c89a8b4f77a021d9e182704e7776fff7bd8bceb')

build() {
	cd "txacme-$pkgver"
	python -m build --wheel --no-isolation
}

## FIXME: import error
# check() {
# 	cd "txacme-$pkgver"
# 	PYTHONPATH=./src pytest -x --disable-warnings
# }

package() {
	cd "txacme-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
