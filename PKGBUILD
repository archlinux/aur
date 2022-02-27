# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.6.0
pkgrel=2
pkgdesc='Bayesian Optimization in PyTorch'
arch=('any')
url='https://botorch.org'
license=('MIT')
depends=('python>=3.7' 'python-pytorch' 'python-gpytorch' 'python-scipy')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools-scm')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/botorch/botorch-$pkgver.tar.gz")
sha256sums=('e8d4c2c7187c20b12251f7b791b964ce311ed8cdca28b8bb7ebbedf745f92987')

build() {
	cd "botorch-$pkgver"
	## requires (setuptools<47); skip check
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "botorch-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
