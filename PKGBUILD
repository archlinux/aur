# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pyetrade
pkgver=1.3.4
pkgrel=1
pkgdesc="Python E-Trade API wrapper"
arch=('any')
url="https://github.com/jessecooper/pyetrade"
license=('GPL3')
depends=(
	'python-dateutil'
	'python-requests'
	'python-requests-oauthlib'
	'python-xmltodict'
	'python-jxmlease')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-pytest' 'python-pytest-mock')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('634b3d8248decf73f872c5bbe7bbf35fe75edfbe83b508e0f8c02c01fa8d4460')

build() {
	cd "pyetrade-$pkgver"
	python setup.py build
	cd docs
	make man
}

check() {
	cd "pyetrade-$pkgver"
	pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "pyetrade-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 docs/_build/man/pyetrade.1 -t "$pkgdir/usr/share/man/man1/"
}
