# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.6.4
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('any')
url='https://github.com/pytorch/botorch'
license=('MIT')
depends=(
	'python>=3.7'
	'python-pytorch'
	'python-gpytorch'
	'python-scipy'
	'python-multipledispatch'
	'python-pyro-ppl')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
	'python-setuptools-scm')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/botorch/botorch-$pkgver.tar.gz")
sha256sums=('3fd28417f55749501a45378f72cd5ca7614e2e05b7b65c6b4eb9b72378bc665a')

build() {
	cd "botorch-$pkgver"
	## requires (setuptools<48); skip check
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	cd "botorch-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
