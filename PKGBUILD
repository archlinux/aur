# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-logging_tree
pkgver=1.10
pkgrel=1
pkgdesc='Debug Python logging problems by printing out the tree of handlers you have defined.'
url='https://github.com/brandon-rhodes/logging_tree'
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-logging-tree')
replaces=('python-logging-tree')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/logging-tree/logging_tree-$pkgver.tar.gz")
sha256sums=('cd78848fe0ee4aafcc64fa8a66f96f177186ff3d883619b1d7f3628564802095')

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
