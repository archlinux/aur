# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-doubleratchet
_pkgname2=python2-doubleratchet
_tag=v0.7.0-beta
pkgbase=${_pkgname}
pkgname=("${_pkgname}" "${_pkgname2}")
pkgver=0.7.0.beta
pkgrel=2
pkgdesc="A python implementation of the Double Ratchet algorithm"
url='https://github.com/Syndace/python-doubleratchet'
license=('MIT')
arch=('any')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "%s" "$(git describe --tags | sed -e 's/^v//;s/-/./')"
}

build_python-doubleratchet() {
    cd ${_pkgname}
    python3 setup.py build
}

build_python2-doubleratchet() {
    cd ${_pkgname}
    python2 setup.py build
}

package_python-doubleratchet() {
    depends=('python-pynacl'
             'python-cryptography')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-doubleratchet() {
    depends=('python2-pynacl'
             'python2-cryptography')
    provides=("${_pkgname2}")
    conflicts=("${_pkgname2}")

    cd ${_pkgname}
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
