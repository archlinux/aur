# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-rabadb
pkgver=2.0
pkgrel=1
pkgdesc="Lightweight uncomplicated schemaless ORM on top of sqlite3"
arch=('any')
url='https://github.com/tariqdaouda/rabadb'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/r/rabaDB/rabaDB-$pkgver.tar.gz")
sha256sums=('cab1eeaaa202006749877cf4608dcb2a0b2e45843306ea860e957304cd861b42')

prepare() {
	cd "rabaDB-$pkgver"
	sed -i '/sample=sample/s/sample/rabaDB-sample/' setup.py
}

build(){
	cd "rabaDB-$pkgver"
	python setup.py build
}

package_python-rabadb() {
	cd "rabaDB-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
