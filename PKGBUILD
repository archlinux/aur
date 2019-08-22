# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-omemo
pkgname=${_pkgname}-syndace-git
pkgver=r83.45b196f
pkgrel=2
pkgdesc="An open python implementation of the OMEMO Multi-End Message and Object Encryption protocol"
url="https://github.com/Syndace/${_pkgname}"
license=('MIT')
arch=('any')
depends=('python-pynacl'
         'python-cryptography'
         'python-xeddsa'
         'python-doubleratchet'
         'python-x3dh'
         'python-protobuf')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=(${_pkgname}-syndace)
provides=(${_pkgname}-syndace)

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    python3 setup.py build
}

package() {
    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
