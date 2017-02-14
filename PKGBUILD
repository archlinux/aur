# Maintainer: Alexandre Bouvier <contact AT amb DOT tf>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>
# Contributor: Philipp Joram <phijor AT t-online DOT de>

pkgbase='python-axolotl'
pkgname=('python-axolotl' 'python2-axolotl')
pkgver=0.1.35
pkgrel=3
pkgdesc="Python port of libaxolotl"
url="https://github.com/tgalal/python-axolotl"
arch=('any')
license=('GPL3')
makedepends=('python2-setuptools' 'python2-dateutil' 'python2-protobuf' 'python2-crypto' 'python2-axolotl-curve25519'
             'python-setuptools' 'python-dateutil' 'python-protobuf' 'python-crypto' 'python-axolotl-curve25519')
source=("https://github.com/tgalal/python-axolotl/archive/$pkgver.tar.gz")
md5sums=('3c2e0580c4dce21161a4ebdf18f4438d')

prepare() {
	cp -a "${pkgbase}-${pkgver}"{,-python2}
}

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	python setup.py build

	cd "${srcdir}/${pkgbase}-${pkgver}-python2"
	python2 setup.py build
}

package_python-axolotl() {
	depends=('python' 'python-dateutil' 'python-protobuf' 'python-crypto' 'python-axolotl-curve25519')

	cd "${pkgbase}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-axolotl() {
	depends=('python2' 'python2-dateutil' 'python2-protobuf' 'python2-crypto' 'python2-axolotl-curve25519')

	cd "${pkgbase}-${pkgver}-python2"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
