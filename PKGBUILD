# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=pyutil
pkgname=python-pyutil
pkgver=3.3.0
pkgrel=2
pkgdesc="General-purpose python library (used by tahoe-lafs)"
arch=('any')
url='https://pypi.org/project/pyutil'
license=('GPL2')
depends=('python')
optdepends=('python-simplejson: jsonutil support'
            'python-zbase32: randcookie support')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyutil/pyutil-$pkgver.tar.gz"
        'setup.py.patch')
sha256sums=('8c4d4bf668c559186389bb9bce99e4b1b871c09ba252a756ccaacd2b8f401848'
            'c04d9474203ff677a0a23818d1d78eb7564f51f99dfac4ebf512170b5fdf7004')

prepare() {
	patch -p1 -d "pyutil-$pkgver" < setup.py.patch
	rm -rf "$pkgbase-$pkgver/$pkgbase/test/"
	find "$pkgbase-$pkgver" -name '*.pyc' -delete
}

build() {
	cd "$pkgbase-$pkgver"
	python -m build --wheel --no-isolation
}

package_python-pyutil() {
	cd "$pkgbase-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
