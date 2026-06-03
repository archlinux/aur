# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
_pkg="${pkgname#python-}"
pkgver=0.18.0
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('any')
url='https://github.com/meta-pytorch/botorch'
license=('MIT')
depends=(
	'python'
	'python-gpytorch'
	'python-linear-operator'
	'python-multipledispatch'
	'python-ninja'
	'python-pyre-extensions'
	'python-pytorch'
	'python-scipy'
	'python-threadpoolctl'
	'python-typing_extensions'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-wheel'
)
checkdepends=('python-pytest')
optdepends=(
	'python-jax: fully Bayesian (SAAS) models via JAX/NUTS sampling'
	'python-jaxlib: fully Bayesian (SAAS) models via JAX/NUTS sampling'
	'python-numpyro: fully Bayesian (SAAS) models via NUTS sampling'
	'python-pymoo: multi-objective optimization utilities [pymoo]'
)
source=("https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('f2928e67b6cff8450891874c0ab97dd59f811ae9169a47543e1dad6c77019f7f')

build() {
	cd "$_pkg-$pkgver"
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD:$PYTHONPATH" python -c "import botorch; print(getattr(botorch, '__version__', 'ok'))"
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
