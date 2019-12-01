# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=PuLP
pkgbase=python-pulp
pkgname=(python-pulp python2-pulp)
pkgver=2.0
pkgrel=1
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("BSD")
url="https://github.com/coin-or/pulp"
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/e4/33/2882343b235326f6a1b8c6208ade294e3f4efd12d635af7e36eb27b69202/$_pkgname-$pkgver.tar.gz")
sha512sums=('21a67e5e8b8911e472f5dd1525dc9cdccd26ad3c85b3c8070d2f69b91bc47cbb47751e72a152f0efefaafcf7c07e4d8215962f05a14cb14ce113f4399b514d52')

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
	depends=('python-pyparsing')
	_package_for_python_version python
}

package_python2-pulp() {
	depends=('python2-pyparsing')
	_package_for_python_version python2

	rm "$pkgdir"/usr/bin/pulptest
}
