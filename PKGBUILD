# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

## GPG key: https://github.com/trbs.gpg

pkgname=python-pid
_name=pid
pkgver=3.0.4
pkgrel=1
pkgdesc='Pidfile featuring stale detection and file-locking'
arch=('any')
url='https://github.com/trbs/pid'
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_name/$_name-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/$_name/$_name-$pkgver.tar.gz.asc")
sha256sums=('0e33670e83f6a33ebb0822e43a609c3247178d4a375ff50a4689e266d853eb66'
            'SKIP')
validpgpkeys=('13FFEEE3DF809D320053C587D6E95F20305701A1') ## trbs

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
