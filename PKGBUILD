# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>
# Contributors: Arthur Țițeică <arthur dot titeica at gmail>
# Contributors: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=simp_le-git
_pkgname=simp_le
pkgver=0.20.0.r0.g86d2858
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
        'remove-deps-version-bounds.patch')
sha256sums=('SKIP'
            '806cffa689bd0e8046122d7f554232b628b2dedd383a95605f36d104d61ffb41')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    patch -Np1 -i "${srcdir}/remove-deps-version-bounds.patch"
}

package() {
    cd "${srcdir}/${_pkgname}"

    python setup.py install --root="$pkgdir/" --optimize=1
}
