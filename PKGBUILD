# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: RubenKelevra <ruben+aur-sctp-python@vfn-nrw.de>

pkgname=python-sctp
_pkg="py${pkgname#python-}"
pkgver=0.7.1
pkgrel=1
pkgdesc="Python module for the SCTP protocol stack and library"
arch=('x86_64')
url="https://github.com/P1sec/pysctp"
license=('LGPL')
depends=('lksctp-tools')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('fadb1cf7ed8bef4595ecc8963012a58a8f7d4bf69bc94a6942ed2908196e7fdf')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
