# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-micloud
_pkg="${pkgname#python-}"
pkgver=0.5
pkgrel=2
pkgdesc='Library for connecting to Xiaomi MiCloud'
arch=('any')
license=('MIT')
url='https://github.com/squachen/micloud'
depends=('python-click' 'python-pycryptodome' 'python-requests' 'python-tzlocal')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('d5d77c40c182b20fa256c8c1b5383eb296515f1f75418e997c75465e5e1af403')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
