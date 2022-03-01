# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.6.1
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('any')
url='https://botorch.org'
license=('MIT')
depends=(
	'python>=3.7'
	'python-pytorch'
	'python-gpytorch'
	'python-scipy'
	'python-multipledispatch')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools-scm')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/botorch/botorch-$pkgver.tar.gz")
sha256sums=('cd28bc18cff0c621d95df4b614bad76105cb27feed219864332222b7524b97ca')

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
