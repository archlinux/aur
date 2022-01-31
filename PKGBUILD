# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-smda
pkgver=1.7.0
pkgrel=1
pkgdesc="Recursive diassembler optimized for CFG recovery from memory dumps"
arch=('any')
url="https://github.com/danielplohmann/smda"
license=('BSD')
depends=('python-capstone' 'python-lief')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/smda/smda-$pkgver.tar.gz")
sha256sums=('a8a11d1a126f06d389c79217d4960681bb1137ce6e08ab011a41c5793368b0b3')

build() {
	cd "smda-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "smda-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
