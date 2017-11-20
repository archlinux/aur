# Maintainer: Felix Buehler <account@buehler.de>

pkgname=("python2-pykwalify")
_pkgname=pykwalify
pkgver=1.6.0
pkgrel=3
pkgdesc='Python lib/cli for JSON/YAML schema validation'
arch=('any')
url='https://github.com/Grokzen/pykwalify'
license=('MIT')
depends=('python2' 'python2-dateutil' 'python2-docopt' 'python2-yaml')
makedepends=('python2-dateutil' 'python2-docopt' 'python2-yaml')
checkdepends=('python2-pytest' 'python2-testfixtures')
source=("https://github.com/Grokzen/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
provides=('pykwalify')
sha256sums=('97f880ccf5de3b50f85d08226333e4474fcb1ede8d76438e7a6df0831cf0d95d')

prepare() {
	mv -f ${_pkgname}-${pkgver}{,-py2}
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}-py2"
	python2 setup.py build
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}-py2"
	PYTHON=python2 python2 setup.py test
}

package_python2-pykwalify() {
	cd "${srcdir}/${_pkgname}-${pkgver}-py2"
	python2 setup.py -q install --root="$pkgdir" --optimize=1
	mv "${pkgdir}/usr/bin/pykwalify" "${pkgdir}/usr/bin/pykwalify2"
}
