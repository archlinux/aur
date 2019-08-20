# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-doubleratchet
_pkgname2=python2-doubleratchet
pkgbase=${_pkgname}-git
pkgname=("${_pkgname}-git" "${_pkgname2}-git")
pkgver=r35.95524cf
pkgrel=1
pkgdesc="A python implementation of the Double Ratchet algorithm"
url='https://github.com/Syndace/python-doubleratchet'
license=('MIT')
arch=('any')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build_python-doubleratchet-git() {
    cd ${_pkgname}
    python3 setup.py build
}

build_python2-doubleratchet-git() {
    cd ${_pkgname}
    python2 setup.py build
}

package_python-doubleratchet-git() {
    depends=('python-pynacl'
             'python-cryptography')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-doubleratchet-git() {
    depends=('python2-pynacl'
             'python2-cryptography')
    provides=("${_pkgname2}")
    conflicts=("${_pkgname2}")

    cd ${_pkgname}
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
