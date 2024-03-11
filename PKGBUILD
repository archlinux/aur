Maintainer: 
# Contributor: cqzw555 <cqzw555 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=pyutil
pkgname=python-pyutil
pkgver=3.3.6
pkgrel=1
pkgdesc="General-purpose python library (used by tahoe-lafs)"
arch=('any')
url='https://pypi.org/project/pyutil'
license=('GPL2')
depends=('python')
optdepends=('python-simplejson: jsonutil support'
            'python-zbase32: randcookie support')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-versioneer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyutil/pyutil-$pkgver.tar.gz"
        'setup.py.patch')
sha256sums=('5dc3d6bb9c5bababb5d0b773e094045d75712e8b34af2d29b0e28602668267c0'
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
