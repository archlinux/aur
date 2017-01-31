# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Matt Hamilton <m at tthamilton dot com>

_pkgname=tqdm
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=4.11.2
pkgrel=1
pkgdesc="Simple Python Progress Meter"
arch=('any')
url="https://pypi.python.org/pypi/tqdm"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python')
options=('!emptydirs')
source=(https://github.com/tqdm/tqdm/releases/download/v${pkgver}/tqdm-${pkgver}.tar.gz)
sha512sums=('3aca25ffa76d4f9562f3dd980dcd0a2cc936ef4b8b155394323c7ea7eeeade692f567b294c82827327c55029b9b969e65c1f45dbc5be9b265c2c23f84c0fb056')

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

    # Prevent both python2 and python3 packages from installing executable
    # in the same place, prefer python3.
    rm -f "${pkgdir}/usr/bin/tqdm"
}
