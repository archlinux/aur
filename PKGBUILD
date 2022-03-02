# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: hexchain <i at hexchain dot org>

pkgname=python-pyperformance
pkgver=1.0.4
pkgrel=1
pkgdesc='Python Performance Benchmark Suite'
license=('MIT')
arch=('any')
url="https://github.com/python/pyperformance"
depends=('python-pyperf' 'python-toml' 'python-packaging')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyperformance/pyperformance-$pkgver.tar.gz")
sha256sums=('759645cad9492be36301a7d2abeae564ef66e93539812a55e576839c81df80fa')

build() {
	cd "pyperformance-$pkgver"
	python -m build --wheel --no-isolation
	cd doc
	make man
}

package() {
	export PYTHONHASHSEED=0
	cd "pyperformance-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 doc/build/man/pythonperformancebenchmarksuite.1 \
		-t "$pkgdir/usr/share/man/man1/"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
