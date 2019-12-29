# Maintainer: DJ Lucas <dj@linuxfromscratch.org>

pkgname=('python-aioh2')
pkgver=0.2.2
pkgrel=1
pkgdesc="Client and server software to query DNS over HTTPS, using Google DNS-over-HTTPS protocol"
pkgrelname='aioh2'
url="https://github.com/decentfox/${pkgrelname}"
arch=('x86_64')
license=('BSD')
makedepends=('python-coverage'
             'python-cryptography'
             'python-pyaml'
             'python-setuptools'
             'python-sphinx'
             'python-tox'
             'python-watchdog'
             'python-wheel')
depends=('python-h2'
         'python-priority')
source=("$url/archive/v$pkgver.tar.gz"
        "aioh2-upstream-fixes-1.patch")
sha256sums=('250f79bfb4535225a6507d047427c0f94a1e3974a2b64b51ff3fef8970352d9a'
            '398fb996756899247a0836739821062681c09b46206ca64fba8a1d2cd721a3ec')

build() {
    cd "${srcdir}/${pkgrelname}-${pkgver}"
    patch -Np1 -i "${srcdir}/aioh2-upstream-fixes-1.patch"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgrelname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}"
}
# vim:set ts=4 sw=4 et:
