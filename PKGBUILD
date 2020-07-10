# Maintainer: spider-mario <spidermario@free.fr>

_pkgname=amply
pkgbase=python-amply
pkgname=(python-amply python2-amply)
pkgver=0.1.2
pkgrel=1
pkgdesc="A Python package for AMPL/GMPL datafile parsing"
arch=("any")
license=("EPL")
url="http://github.com/willu47/amply"
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('f555c44d80eecde41d0a1b946cc3192e6e3b637ee4c33896ccb251527358eb8761fec79875da168be610268fd4cbaa3a4c55bfff8b777b82ff350222bdf07603')

prepare() {
	for _python in python python2; do
		rm -fr $_python-amply
		cp -r $_pkgname-$pkgver $_python-amply
	done
}

build() {
	for _python in python python2; do
		pushd $_python-amply
		$_python setup.py build
		popd
	done
}

_package_for_python_version() {
	_python="$1"

	cd $_python-amply

	$_python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}

package_python-amply() {
	depends=('python-docutils' 'python-pyparsing')
	_package_for_python_version python
}

package_python2-amply() {
	depends=('python2-docutils' 'python2-pyparsing')
	_package_for_python_version python2
}
