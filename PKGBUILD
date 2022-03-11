# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-omemo-backend-signal
pkgname=${_pkgname}-git
pkgver=r16.614b763
pkgrel=1
pkgdesc="A backend for python-omemo offering compatibility with libsignal."
url="https://github.com/Syndace/${_pkgname}"
license=('MIT')
arch=('any')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git")
sha256sums=('SKIP')
depends=('python-cryptography'
         'python-xeddsa-git'
         'python-doubleratchet-git'
         'python-x3dh-git'
         'python-protobuf'
         'python-omemo-syndace-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}
}

build() {
    cd ${_pkgname}
    python3 setup.py build
}

package() {
    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
