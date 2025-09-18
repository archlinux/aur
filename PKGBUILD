# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: vanyasem

pkgname=python-allpairspy
pkgver=2.5.1
pkgrel=1
pkgdesc='Python library for test combinations generator'
arch=('any')
license=('MIT')
url='https://github.com/thombashi/allpairspy'
changelog=CHANGES.txt
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('338d876492b9d981015067676d444a6c0ed69e398ed640e84a9e8f310782cb26')

build() {
	cd "allpairspy-$pkgver"
	python setup.py build
}

check() {
	cd "allpairspy-$pkgver"
	PYTHONPATH="$PWD" pytest
}

package() {
	cd "allpairspy-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
