# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

# There's a gpg signature, but no matching key. Where to get it?

pkgname=python-pid
_name=pid
pkgver=3.0.3
pkgrel=2
pkgdesc='Pidfile featuring stale detection and file-locking'
arch=('any')
url='https://github.com/trbs/pid'
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_name/$_name-$pkgver.tar.gz")
sha256sums=('925b61c35b6f2bc6b43075f493e99792f1473575a0beeb85bcf7de1d6a4a3c7d')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
