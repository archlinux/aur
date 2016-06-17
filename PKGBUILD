# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-signedjson
pkgname=($pkgbase python2-signedjson)
pkgver=1.0.0
pkgrel=1
pkgdesc='Sign JSON with Ed25519 signatures'
license=('Apache')
arch=('any')
url='https://pypi.python.org/pypi/signedjson/'
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/python-signedjson/archive/v${pkgver}.tar.gz")
md5sums=('2b74a01472afe3465db1eecbcecd663b')

prepare() {
	cp -a "python-signedjson-${pkgver}"{,-python2}
}

build() {
	cd "$srcdir/python-signedjson-${pkgver}"
	python setup.py build

	cd "$srcdir/python-signedjson-${pkgver}-python2"
	python2 setup.py build
}

package_python-signedjson() {
	depends=('python')

	cd "python-signedjson-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-signedjson() {
	depends=('python2')

	cd "python-signedjson-${pkgver}-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
