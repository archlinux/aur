# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Matt Hamilton <m at tthamilton dot com>

_pkgname=tqdm
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=4.4.3
pkgrel=2
pkgdesc="Simple Python Progress Meter"
arch=('any')
url="https://pypi.python.org/pypi/tqdm"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python')
options=('!emptydirs')
source=(https://github.com/tqdm/tqdm/releases/download/v${pkgver}/tqdm-${pkgver}.tar.gz)
sha512sums=('ebbd70a82829b828d2acc08ddfdedd52d502861334fa462f7c1c3776aef748866579ff839083d39ecd9d9244abc2bb39aabc54686f0d20bfb141392410e6a805')

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
