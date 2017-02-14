# Maintainer: Alexandre Bouvier <contact AT amb DOT tf>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>
# Contributor: Philipp Joram <phijor AT t-online DOT de>

pkgbase='python-axolotl'
pkgname=('python-axolotl' 'python2-axolotl')
pkgver=0.1.35
pkgrel=2
pkgdesc="Python port of libaxolotl"
url="https://github.com/tgalal/python-axolotl"
arch=('any')
license=('GPL3')
makedepends=('python2-setuptools' 'python2-dateutil' 'python2-protobuf' 'python2-crypto' 'python2-axolotl-curve25519'
             'python-setuptools' 'python-dateutil' 'python-protobuf' 'python-crypto' 'python-axolotl-curve25519')
source=("https://pypi.python.org/packages/d5/6b/cc0256a10d11f8a8868e9c8673a0edcdba438c1e92c4b66e52c6b575ca6a/python-axolotl-0.1.35.tar.gz")
md5sums=('34c54a41fe2271caade486fc92392541')

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
