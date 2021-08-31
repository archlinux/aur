# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>

pkgbase=justext
pkgname=(python-justext python2-justext)
pkgver=2.2.0
pkgrel=1
pkgdesc="Heuristic based boilerplate removal tool"
url="https://github.com/miso-bellica/justext"
arch=('any')
license=('BSD')
changelog=CHANGELOG.rst
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.zip::https://files.pythonhosted.org/packages/source/j/jusText/jusText-$pkgver.zip")
sha256sums=('330035dfaaa960465276afa1836dfb6e63791011a8dfc6da2757142cc4d14d54')

prepare() {
	cp -a "jusText-$pkgver" "jusText-$pkgver-py2"
}

build() {
	pushd "jusText-$pkgver"
	python setup.py build

	popd

	pushd "jusText-$pkgver-py2"
	python2 setup.py build
}

package_python-justext() {
	depends=('python-lxml>=4.4.2')
	provides=('justext')
	replaces=('justext')

	cd "jusText-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_python2-justext() {
	depends=('python2-lxml>=4.4.2')
	provides=('justext')
	replaces=('justext')

	cd "jusText-$pkgver-py2"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
