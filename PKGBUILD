# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=can
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=3.1.1
pkgrel=1
pkgdesc="Python library to access CAN bus via SocketCAN, Kvaser's CANLIB, or CAN over Serial"
arch=('any')
url="https://pypi.python.org/pypi/python-can"
license=('LGPLv3')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python')
source=(https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('27d0290324d2387131d389969f5cab56e9aba2d31107fdab5f4187152e4ca8443e5de3b610333b8b5871ca8e3f77f7acdc5d1a3d7c23747c2413521b6c606a3a')

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
