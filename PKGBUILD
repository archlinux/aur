# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-pymacaroons-pynacl
pkgname=(${pkgbase} python2-pymacaroons-pynacl)
pkgver=0.9.3
pkgrel=1
pkgdesc='Macaroon library for Python'
license=('Apache')
arch=('any')
url='https://github.com/matrix-org/pymacaroons'
makedepends=('python-setuptools'
             'python2-setuptools'
             'git')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/pymacaroons/archive/v${pkgver}.tar.gz")
md5sums=('b7075988e562f805e69ae7d8e16542b5')

prepare() {
	cp -a "pymacaroons-${pkgver}"{,-python2}
}

build() {
	cd "${srcdir}/pymacaroons-${pkgver}"
	python setup.py build

	cd "${srcdir}/pymacaroons-${pkgver}-python2"
	python2 setup.py build
}

package_python-pymacaroons-pynacl() {
	depends=('python' 'python-pynacl' 'python-six')

	cd "pymacaroons-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pymacaroons-pynacl() {
	depends=('python2' 'python2-pynacl' 'python2-six')

	cd "pymacaroons-${pkgver}-python2"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
