# Maintainer: Felix Buehler <account@buehler.de>

pkgbase="python-pykwalify"
_pkgname=pykwalify
pkgname=("python-pykwalify" "python2-pykwalify")
pkgver=1.6.0
pkgrel=2
pkgdesc='Python lib/cli for JSON/YAML schema validation'
arch=('any')
url='https://github.com/Grokzen/pykwalify'
license=('MIT')
depends=('python' 'python2') 
makedepends=('python-dateutil' 'python2-dateutil' 'python-docopt' 'python2-docopt' 'python-yaml' 'python2-yaml')
checkdepends=('python-pytest' 'python2-pytest' 'python-testfixtures' 'python2-testfixtures')
source=("https://github.com/Grokzen/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
provides=('pykwalify')
sha256sums=('97f880ccf5de3b50f85d08226333e4474fcb1ede8d76438e7a6df0831cf0d95d')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build

	cd "${srcdir}/${_pkgname}-${pkgver}-py2"
	python2 setup.py build
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py test

	cd "${srcdir}/${_pkgname}-${pkgver}-py2"
	PYTHON=python2 python2 setup.py test
}

package_python-pykwalify() {
	depends=('python-dateutil' 'python-docopt' 'python-yaml')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py -q install --root="$pkgdir" --optimize=1
}

package_python2-pykwalify() {
	depends=('python2-dateutil' 'python2-docopt' 'python2-yaml')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py -q install --root="$pkgdir" --optimize=1
	mv "${pkgdir}/usr/bin/pykwalify" "${pkgdir}/usr/bin/pykwalify2"
}