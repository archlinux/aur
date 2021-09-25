# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-logging-helper
pkgver=1.9.0
pkgrel=1
pkgdesc="Provides enhancements to built-in logging module"
url="https://pypi.python.org/pypi/logging-helper"
arch=('any')
license=('MIT')
depends=(
	'python-better-exceptions>=0.1.6'
	'python-logging-tree>=1.7'
	'python-future>=0.16.0')
makedepends=('python-setuptools')
checkdepends=('python-testfixtures')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/logging_helper/logging_helper-$pkgver.tar.gz")
sha256sums=('03aaff3c4e6967f7a18d576acba1adf22c47d30df4d4bf9164514d046c818645')

build() {
	cd "logging_helper-$pkgver"
	python setup.py build
}

check() {
	cd "logging_helper-$pkgver"
	python -m unittest logging_helper/unittests/test_logging_helper.py
}

package() {
	cd "logging_helper-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root=${pkgdir} --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
