# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-codetiming
pkgver=1.3.0
pkgrel=2
pkgdesc="Flexible, customizable timer for your Python code"
license=('MIT')
arch=('any')
url='https://github.com/realpython/codetiming'
depends=('python>=3.6')
makedepends=('python-flit-core' 'python-build' 'python-install')
checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/codetiming/codetiming-$pkgver.tar.gz")
sha256sums=('7f9949dad6438f458a22b811b0738c55e45f685d27551352871e15811f3a5e89')

build() {
	cd "codetiming-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "codetiming-$pkgver"
	python -m pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "codetiming-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -D LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -D README.md AUTHORS.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
