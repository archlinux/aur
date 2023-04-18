# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>

pkgname=python-jdcal
_pkg="${pkgname#python-}"
pkgver=1.4.1
pkgrel=9
pkgdesc="Julian dates, from proleptic Gregorian and Julian calendars"
arch=('any')
url="https://github.com/phn/jdcal"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/j/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('472872e096eb8df219c23f2689fc336668bdb43d194094b5cc1707e1640acfc8')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
