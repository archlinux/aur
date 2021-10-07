# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-logging_tree
pkgver=1.9
pkgrel=2
pkgdesc='Introspect and display the logger tree inside "logging"'
url='https://github.com/brandon-rhodes/logging_tree'
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
provides=('python-logging-tree')
replaces=('python-logging-tree')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3e15b37911efcdbc7195199aa20a463fd37a7385251a90600b5df1eb28569c35')

build() {
	cd "logging_tree-$pkgver"
	python setup.py build
}

check() {
	cd "logging_tree-$pkgver"
	python -m unittest discover logging_tree
}

package() {
	cd "logging_tree-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
