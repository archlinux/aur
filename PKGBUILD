# Maintainer: Yardena Cohen <yardenack at gmail dot com>

_pkgname=tqdm
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=3.8.0
pkgrel=1
pkgdesc="Simple Python Progress Meter"
arch=('any')
url="https://pypi.python.org/pypi/tqdm"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python')
options=('!emptydirs')
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('4d9e75f5affde1435f28b850d3f978dcd98a48e239350e9bcc0f03a013db1d5e66545bc519b8376f677eaa53f40225198519fa975c97e3e0e85cd4e7a38b74dd')

prepare() {
	 cp -a "${srcdir}/${_pkgname}-${pkgver}"{,-py2}
}

build() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build

	 cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py build
}

package_python-tqdm() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
	 python  setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-tqdm() {
	 cd "${srcdir}/${_pkgname}-${pkgver}-py2"
	 python2 setup.py install --root="${pkgdir}" --optimize=1
}
