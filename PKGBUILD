# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-blspy
pkgver=1.0.9
pkgrel=2
pkgdesc='Python BLS Signatures implementation'
url='https://github.com/Chia-Network/bls-signatures'
arch=('x86_64')
license=('Apache')
depends=('libsodium' 'gmp' 'pybind11')
makedepends=(
	'cmake'
	'git'
	'python-build'
	'python-install'
	'python-wheel'
	'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/blspy/blspy-$pkgver.tar.gz")
sha256sums=('ea47a2990ab0877ec6f717355f2c65afed27f5082ff3b369d83ec6ce3ea29396')

build() {
	cd "blspy-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "blspy-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
}
