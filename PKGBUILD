# Maintaner: Ocelot 1112345@airmail.cc

_pkgname=python-censys
_pypiname=censys
pkgbase=python-censys
pkgname=('python-censys')
pkgdesc='A light weight Python wrapper to the Censys REST API'
pkgver=0.0.8
pkgrel=1
url="https://github.com/censys/censys-python"
license=('Apache')
arch=("any")
makedepends=('python' 'python-setuptools' 'python2-setuptools' 'python-requests' 'python2-requests' 'python-netaddr' 'python2-netaddr')
source=("https://files.pythonhosted.org/packages/88/4b/3ca07679928c26bb5503b53c37e2f6eef2521289956e2c1bf74b64008afa/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('7e5f623fbdc2ce1dcf3ef531e63ba486f7e255f20c4d4006b4f70b6d59a78534')

prepare() {
    # Create a copy for the python2 package
    cp -r "${_pypiname}-${pkgver}" "python2-${_pypiname}-${pkgver}"
}

build() {
	# build for python 3
	cd "${srcdir}/${_pypiname}-${pkgver}"
	python setup.py build
	
	# build for python 2
	cd "${srcdir}/python2-${_pypiname}-${pkgver}"
	python2 setup.py build
}

package_python-censys() {
	pkgdesc="A light weight Python 3 wrapper to the Censys REST API"
	depends=('python' 'python-requests' 'python-netaddr')
	cd "${srcdir}/${_pypiname}-${pkgver}"
	
	python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-censys() {
	pkgdesc="A light weight Python 2 wrapper to the Censys REST API"
	depends=('python2' 'python2-requests' 'python2-netaddr')
	cd "${srcdir}/python2-${_pypiname}-${pkgver}"
	
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
