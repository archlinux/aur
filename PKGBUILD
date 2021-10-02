# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgbase=python-sercol
pkgname=('python-sercol' 'python2-sercol')
pkgver=0.1.4
pkgrel=1
pkgdesc="Rich collection class with grouping and filtering helpers"
arch=('any')
url="https://pypi.python.org/pypi/sercol"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=(
	'python-nose'
	'python-serializable'
	'python-simplejson'
	'python-pandas'

	'python2-nose'
	'python2-serializable'
	'python2-simplejson'
	'python2-pandas'
	'python2-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/sercol/sercol-$pkgver.tar.gz")
sha256sums=('eab962cf60bccb3c500b0eac7f51e865efefc4203d0323da3c4d5414e0b4e577')

prepare() {
	cp -a "sercol-$pkgver"{,-py2}
}

build(){
	cd "$srcdir/sercol-$pkgver"
	python setup.py build

	cd "$srcdir/sercol-$pkgver-py2"
	python2 setup.py build
}

check() {
	cd "$srcdir/sercol-$pkgver"
	python setup.py nosetests

	cd "$srcdir/sercol-$pkgver-py2"
	python2 setup.py nosetests
}

package_python2-sercol() {
	depends=('python2-serializable' 'python2-simplejson' 'python2-pandas')

	cd "sercol-$pkgver-py2"
	PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python-sercol() {
	depends=('python-serializable' 'python-simplejson' 'python-pandas')

	cd "sercol-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
