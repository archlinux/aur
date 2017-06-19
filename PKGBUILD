# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>
# Contributors: Arthur Țițeică <arthur dot titeica at gmail>
# Contributors: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=simp_le-git
_pkgname=simp_le
pkgver=0.2.0.r10.gd88af9d
pkgrel=1
epoch=1
pkgdesc="Simple Let's Encrypt client."
arch=('any')
license=('GPL')
url="https://github.com/zenhack/simp_le"
depends=('ca-certificates'
         'python-setuptools'
         'python-pip'
         'python-wheel'
         'python-cryptography'
         'python-mock'
         'python-pyopenssl'
         'python-acme')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+https://github.com/zenhack/simp_le.git"
        'acme_0.15.patch')
md5sums=('SKIP'
         '718c7d24821a24f92f7fa26401635f8c')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -Np1 -i "${srcdir}/acme_0.15.patch"
}

package() {
    cd "${srcdir}/${_pkgname}"

    python setup.py install --root="$pkgdir/" --optimize=1

    install -d "${pkgdir}/usr/share/${_pkgname}"
    cp -dr --no-preserve=ownership examples/ "${pkgdir}/usr/share/${_pkgname}"
}
