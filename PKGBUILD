# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=can
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=1.4.3
pkgrel=1
pkgdesc="Python library to access CAN bus via SocketCAN, Kvaser's CANLIB, or CAN over Serial"
arch=('any')
url="https://pypi.python.org/pypi/python-can"
license=('LGPLv3')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python')
source=(https://pypi.python.org/packages/29/d6/b29aa8513fa51e43688d74857047412408c5524c566553fec6e6d6eb23c0/python-can-${pkgver}.tar.gz)
sha512sums=('f53770cb77f9f75919f754840e6a94fb67421218e6c55e299e84db9a257636b91bfabdc9a680b1ad729bc43283c75969084b238615bdf5e05ed954231973b171')

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
