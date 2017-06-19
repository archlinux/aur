# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>
# Contributors: Arthur Țițeică <arthur dot titeica at gmail>
# Contributors: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=simp_le-git
_pkgname=simp_le
pkgver=61.3c22bfa
pkgrel=1
pkgdesc="Simple Let's Encrypt client."
arch=('any')
license=('GPL')
url="https://github.com/kuba/simp_le"
depends=('git' 'ca-certificates' 'python-setuptools' 'python-pip' 'python-wheel' 'python-cryptography' 'python-mock'
         'python-pyopenssl' 'python-acme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+https://github.com/kuba/simp_le.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dp -m755 simp_le.py "${pkgdir}"/usr/share/"${_pkgname}"/simp_le.py
    cp -r examples/ "${pkgdir}"/usr/share/"${_pkgname}"/
    install -d "${pkgdir}"/usr/bin/
    ln -s /usr/share/${_pkgname}/simp_le.py "${pkgdir}"/usr/bin/simp_le
}
