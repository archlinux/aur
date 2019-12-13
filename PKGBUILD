# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-omemo-backend-signal
_tag=v0.2.5-beta
pkgname=${_pkgname}
pkgver=0.2.5.beta
pkgrel=1
pkgdesc="A backend for python-omemo offering compatibility with libsignal."
url="https://github.com/Syndace/${_pkgname}"
license=('MIT')
arch=('any')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git#tag=${_tag}")
sha256sums=('SKIP')
depends=('python-cryptography'
         'python-xeddsa'
         'python-doubleratchet'
         'python-x3dh'
         'python-protobuf'
         'python-omemo-syndace')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd ${_pkgname}
    printf "%s" "$(git describe --tag | sed 's/^v//;s/-/./')"
}

build() {
    cd ${_pkgname}
    python3 setup.py build
}

package() {
    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
