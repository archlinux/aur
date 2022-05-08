# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-statprof
_pkg="${pkgname#python-}-smarkets"
pkgver=1.0.0
pkgrel=2
pkgdesc='Statistical profiling for Python'
arch=('any')
url='https://pypi.python.org/pypi/statprof-smarkets'
license=('GPL2')
depends=('python-six')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('b1ecadfb86ead5c75d987fbc8cc0f53e1a3a6c6ea644918a67b3e8bb5036372f')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
