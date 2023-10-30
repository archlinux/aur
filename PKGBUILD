# Maintainer: txtsd <aur.archlinux@ihavea.quest>

_pkgname=archosaur
pkgname=${_pkgname}-git
pkgver=1.0.0.r0.g1bc6939
pkgrel=2
pkgdesc="A PKGBUILD management framework for the Arch User Repository"
arch=('any')
url="https://github.com/txtsd/${_pkgname}"
license=('GPL3')
depends=('bash' 'openssh')
makedepends=('git' 'asciidoc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}

    make PREFIX=/usr
}

package() {
    cd ${_pkgname}

    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
