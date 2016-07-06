# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-frozendict
pkgname=(python-frozendict python2-frozendict)
pkgver=0.6
pkgrel=1
pkgdesc='An immutable dictionary'
license=('MIT')
arch=('any')
url='https://pypi.python.org/pypi/frozendict/'
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/f/frozendict/frozendict-${pkgver}.tar.gz")
md5sums=('d8d6c488b81987356f674fb1c9a68ebb')

prepare() {
	cp -a "frozendict-${pkgver}"{,-python2}
}

build() {
	cd "$srcdir/frozendict-${pkgver}"
	python setup.py build

	cd "$srcdir/frozendict-${pkgver}-python2"
	python2 setup.py build
}

package_python-frozendict() {
	depends=('python')

	cd "frozendict-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-frozendict() {
	depends=('python2')

	cd "frozendict-${pkgver}-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
