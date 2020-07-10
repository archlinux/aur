# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=PuLP
pkgbase=python-pulp
pkgname=(python-pulp python2-pulp)
pkgver=2.2
pkgrel=1
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("BSD")
url="https://github.com/coin-or/pulp"
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('ef67f5bdd65c1c3f0e0fb0d8300f875b923e0684718c81b958d7dfc9d710fd87da5a27851bef7c4b45f6ec0d5d43e8e9ce5862274ada330b650b59092e3b4fcf')

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
	depends=('python-amply')
	_package_for_python_version python
}

package_python2-pulp() {
	depends=('python2-amply')
	_package_for_python_version python2

	rm "$pkgdir"/usr/bin/pulptest
}
