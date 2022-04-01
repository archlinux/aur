# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-logging_tree
pkgver=1.9
pkgrel=3
pkgdesc='Introspect and display the logger tree inside "logging"'
url='https://github.com/brandon-rhodes/logging_tree'
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-logging-tree')
replaces=('python-logging-tree')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/logging-tree/logging_tree-$pkgver.tar.gz")
sha256sums=('fe78b28788c249b515d12a50417e4a96ba095582927b3601a0573886bffc1ff0')

prepare() {
	cd "logging_tree-$pkgver"
	sed -i "/packages=/c\packages=['logging_tree']," setup.py
}

build() {
	cd "logging_tree-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "logging_tree-$pkgver"
	python -m unittest discover logging_tree
}

package() {
	cd "logging_tree-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
