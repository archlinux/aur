# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-pyfirmata
_pkg="pyFirmata"
pkgver=1.1.0
pkgrel=1
pkgdesc="Python interface for the Firmata protocol"
arch=('any')
url="https://github.com/tino/pyFirmata"
license=('MIT')
depends=('python-pyserial')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('cc180d1b30c85a2bbca62c15fef1b871db048cdcfa80959968356d97bd3ff08e')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
