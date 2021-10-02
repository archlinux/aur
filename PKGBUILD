# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgbase=python-typechecks
pkgname=('python-typechecks' 'python2-typechecks')
pkgver=0.1.0
pkgrel=1
pkgdesc="Helper functions for runtime type checking"
arch=('any')
url="https://pypi.python.org/pypi/typechecks"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/typechecks/typechecks-$pkgver.tar.gz")
sha256sums=('7d801a6018f60d2a10aa3debc3af65f590c96c455de67159f39b9b183107c83b')

prepare() {
	cp -a "typechecks-$pkgver"{,-py2}
}

build(){
	pushd "typechecks-$pkgver"
	python setup.py build
	popd

	pushd "typechecks-$pkgver-py2"
	python2 setup.py build
}

check() {
	pushd "typechecks-$pkgver"
	python setup.py nosetests
	popd

	pushd "typechecks-$pkgver-py2"
	python2 setup.py nosetests
}

package_python2-typechecks() {
	depends=('python2')

	cd "typechecks-$pkgver-py2"
	PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python-typechecks() {
	depends=('python')

	cd "typechecks-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
