# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-frozendict
pkgname=(python-frozendict python2-frozendict)
pkgver=1.2
pkgrel=1
pkgdesc='An immutable dictionary'
license=('MIT')
arch=('any')
url='https://github.com/slezica/python-frozendict'
makedepends=('python'
             'python2')
source=("https://pypi.python.org/packages/4e/55/a12ded2c426a4d2bee73f88304c9c08ebbdbadb82569ebdd6a0c007cfd08/frozendict-1.2.tar.gz")
md5sums=('483ce6ddfe68ca197bc123aaafebf9ab')

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
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-frozendict() {
	depends=('python2')

	cd "frozendict-${pkgver}-python2"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
