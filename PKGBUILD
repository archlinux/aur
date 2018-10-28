# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=can
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=3.0.0
pkgrel=1
pkgdesc="Python library to access CAN bus via SocketCAN, Kvaser's CANLIB, or CAN over Serial"
arch=('any')
url="https://pypi.python.org/pypi/python-can"
license=('LGPLv3')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python')
source=(https://files.pythonhosted.org/packages/29/47/59d07bb02d6b244fb631487ae5424a10658c316defeeb90c923b48043792/python-can-3.0.0.tar.gz)
sha512sums=('90bd6a0b0e2717378de6c716be60f58c7b4112ad4b42bbdbec4260ecf31ca7806acad8c902ab2d886171cb4c9aad70418a6eeebbd787be7ad1684fb20f70171b')

prepare() {
	 cp -a "${srcdir}/python-${_pkgname}-${pkgver}"{,-py2}
}

build() {
	 cd "${srcdir}/python-${_pkgname}-${pkgver}"
    python setup.py build

	 cd "${srcdir}/python-${_pkgname}-${pkgver}-py2"
    python2 setup.py build
}

package_python-can() {
	 cd "${srcdir}/python-${_pkgname}-${pkgver}"
	 python  setup.py install --root="${pkgdir}" --optimize=1

     # Clean-up cruft, how can we make setup.py not do this?
     rm -rf ${pkgdir}/usr/lib/python*/site-packages/{examples,test}
}

package_python2-can() {
	 cd "${srcdir}/python-${_pkgname}-${pkgver}-py2"
	 python2 setup.py install --root="${pkgdir}" --optimize=1

     # Clean-up cruft, how can we make setup.py not do this?
     rm -rf ${pkgdir}/usr/lib/python*/site-packages/{examples,test}
}
