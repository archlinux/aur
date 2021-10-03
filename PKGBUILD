# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-notifiers
pkgver=1.3.0
pkgrel=1
pkgdesc="Python logging library for easily sending notifications"
arch=('any')
url='https://github.com/liiight/notifiers'
license=('MIT')
depends=('python-click' 'python-jsonschema' 'python-rfc3987' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-retry' 'python-hypothesis')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('eeb410c8b3968785595977c1edbdd5a68205471b1318a578f2b205fbb8794682')

build(){
	cd "notifiers-$pkgver"
	python setup.py build
}

check() {
	cd "notifiers-$pkgver"
	python setup.py pytest
}

package () {
	cd "notifiers-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
