# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-daemonize
pkgname=(${pkgbase} python2-daemonize)
pkgver=2.4.7
pkgrel=1
pkgdesc='Library to enable your code run as a daemon process on Unix-like systems'
license=('MIT')
arch=('any')
url='https://github.com/thesharp/daemonize'
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://pypi.python.org/packages/84/15/923e3fe48239adf5d697c29e04a3f868d3e4ce8539aab29d6abe784db5be/daemonize-2.4.7.tar.gz")
md5sums=('6759005b12dfeea0d4305f8536b4b0c2')

prepare() {
	cp -a "daemonize-${pkgver}"{,-python2}
}

build() {
	cd "$srcdir/daemonize-${pkgver}"
	python setup.py build

	cd "$srcdir/daemonize-${pkgver}-python2"
	python2 setup.py build
}

package_python-daemonize() {
	depends=('python')

	cd "daemonize-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-daemonize() {
	depends=('python2')

	cd "daemonize-${pkgver}-python2"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
