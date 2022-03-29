# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
pkgver=0.6.3.1
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
sha256sums=('d62abb6246beedba8898ed2f3a78196178f8e3f02d633e9678e7e734caf8c934')

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
