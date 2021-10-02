# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgbase=python-serializable
pkgname=('python-serializable' 'python2-serializable')
pkgver=0.2.1
pkgrel=1
pkgdesc="Base class with serialization helpers for user-defined Python objects"
arch=('any')
url="https://pypi.python.org/pypi/serializable"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=(
	'python-nose'
	'python-simplejson'
	'python-typechecks'

	'python2-nose'
	'python2-simplejson'
	'python2-typechecks')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/serializable/serializable-$pkgver.tar.gz")
sha256sums=('ec604e5df0c1236c06d190043a407495c4412dd6b6fd3b45a8514518173ed961')

prepare() {
	cp -a "serializable-$pkgver"{,-py2}
}

build(){
	pushd "serializable-$pkgver"
	python setup.py build
	popd

	pushd "serializable-$pkgver-py2"
	python2 setup.py build
}

check() {
	pushd "serializable-$pkgver"
	python setup.py nosetests
	popd

	pushd "serializable-$pkgver-py2"
	python2 setup.py nosetests
}

package_python2-serializable() {
	depends=('python2-simplejson' 'python2-six>=1.9.0' 'python2-typechecks>=0.0.2')

	cd "serializable-$pkgver-py2"
	PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python-serializable() {
	depends=('python-simplejson' 'python-six>=1.9.0' 'python-typechecks>=0.0.2')

	cd "serializable-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
