# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Joaquin Garmendia <joaquingc123 at gmail dot com>
# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=python-binarytree
pkgver=6.4.0
pkgrel=1
pkgdesc="Python library for studying binary trees"
arch=('any')
url="https://github.com/joowani/binarytree"
license=('MIT')
depends=('python-graphviz' 'python-setuptools-scm')
makedepends=('python-build' 'python-install' 'python-wheel')
# checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/binarytree/binarytree-$pkgver.tar.gz")
sha256sums=('02e4d199e9bf414782a2bb8da04ad8cd66621de7d25d0756c99b5a36703fa01e')

build() {
	cd "binarytree-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "binarytree-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
