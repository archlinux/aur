# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-pydenticon
pkgname=(${pkgbase} python2-pydenticon)
pkgver=0.3
pkgrel=1
pkgdesc='Library for generating identicons, port of Sigil with enhancements'
license=('BSD')
arch=('any')
url='https://github.com/azaghal/pydenticon'
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://pypi.python.org/packages/24/24/53f3fd292c94c8a6af3dd43e49e26245fddcda9260b3482bc4c696707349/pydenticon-0.3.tar.gz")
md5sums=('597b52f1fab9b373239e040fccf2cd25')

prepare() {
	chmod -R go=u-w "pydenticon-${pkgver}" # files in the source tarball have weird permissions
	cp -a "pydenticon-${pkgver}"{,-python2}
}

build() {
	cd "${srcdir}/pydenticon-${pkgver}"
	python setup.py build

	cd "${srcdir}/pydenticon-${pkgver}-python2"
	python2 setup.py build
}

package_python-pydenticon() {
	depends=('python' 'python-pillow')

	cd "pydenticon-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pydenticon() {
	depends=('python2' 'python2-pillow')

	cd "pydenticon-${pkgver}-python2"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
