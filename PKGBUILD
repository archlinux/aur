# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>
# Contributor: Philipp Joram <phijor AT t-online DOT de>

pkgbase='python-axolotl-curve25519'
pkgname=('python-axolotl-curve25519' 'python2-axolotl-curve25519')
pkgver=r14.e4a9c4d
pkgrel=1
pkgdesc="Python wrapper for curve25519 library"
url="https://github.com/tgalal/${pkgbase}"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('python-setuptools'
             'python2-setuptools')
source=("git://github.com/tgalal/${pkgbase}#commit=e4a9c4de0eae27223200579c58d1f8f6d20637e2")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp -a "${pkgbase}"{,-python2}
}

build() {
	cd "${srcdir}/${pkgbase}"
	python setup.py build

	cd "${srcdir}/${pkgbase}-python2"
	python2 setup.py build
}

package_python-axolotl-curve25519() {
	depends=('python')

	cd "${pkgbase}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-axolotl-curve25519() {
	depends=('python2')

	cd "${pkgbase}-python2"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
