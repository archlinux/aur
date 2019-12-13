# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-omemo
_tag=v0.11.0-beta
pkgname=python-omemo-syndace
pkgver=0.11.0.beta
pkgrel=1
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
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "%s" "$(git describe --tags | sed -e 's/^v//;s/-/./g')"
}

build() {
    cd ${_pkgname}
    python3 setup.py build
}

package() {
    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
