# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: RubenKelevra <ruben+aur-sctp-python@vfn-nrw.de>

pkgname=python-sctp
_pkg="py${pkgname#python-}"
pkgver=0.7.2
pkgrel=1
pkgdesc="Python module for the SCTP protocol stack and library"
arch=('x86_64')
url="https://github.com/P1sec/pysctp"
license=('LGPL')
depends=('lksctp-tools' 'python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('dc39ce71988a264f54d9de114a9c7cc373300ade22d373a90c9f09c38c6a7f40')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
