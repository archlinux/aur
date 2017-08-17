# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=PuLP
pkgbase=python-pulp
pkgname=(python-pulp python2-pulp)
pkgver=1.6.8
pkgrel=1
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("BSD")
url="https://github.com/coin-or/pulp"
depends=("python-pyparsing")
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/b5/87/71293d89377341551f2f331d259c0b7e7324b60ce37c597d0a42f0ebc18d/$_pkgname-$pkgver.tar.gz")
sha512sums=('e78b33f331144f458a585fda396b5c9d1d09e25199d29fc2de39027d6cbee74dfa3325878c77ca01164102adf22ee5bb31beea5af54500c1ad917cedb2dbf783')

prepare() {
	for _python in python python2; do
		rm -fr $_python-pulp
		cp -r $_pkgname-$pkgver $_python-pulp
	done
}

build() {
	for _python in python python2; do
		pushd $_python-pulp
		$_python setup.py build
		popd
	done
}

_package_for_python_version() {
	_python="$1"

	cd $_python-pulp

	$_python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build

	install --directory "$pkgdir"/usr/share/licenses/$pkgname/
	install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python-pulp() {
	_package_for_python_version python
}

package_python2-pulp() {
	_package_for_python_version python2
}
