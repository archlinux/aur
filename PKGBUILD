# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=can
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=2.1.0
pkgrel=1
pkgdesc="Python library to access CAN bus via SocketCAN, Kvaser's CANLIB, or CAN over Serial"
arch=('any')
url="https://pypi.python.org/pypi/python-can"
license=('LGPLv3')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python')
source=(https://pypi.python.org/packages/04/87/0d5b0f2f4e5d7f64a44f74b7f0bc1668457e6aa7e90b04ad15c3b9a44411/python-can-${pkgver}.tar.gz)
sha512sums=('fb0d1a466824044b243bffe9e1f0b4515b226251b6a091c824bf1cd10d63e1a8208931d0685ef60a8cd4df8facfc868a92f51ec8fe4a90a6bf6f24256be6efb9')

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
