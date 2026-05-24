# Maintainer: h8ray <hiddenforever at elektrine dot com>

pkgname=amneziawg-tools-git
_pkgname=amneziawg-tools
pkgver=r517.5d6179a
pkgrel=1
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard"
arch=("x86_64")
url="https://github.com/amnezia-vpn/amneziawg-tools"
license=('GPL-2.0')
makedepends=('git')
optdepends=('resolvconf: if you are controlling DNS via AmneziaWG')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/amnezia-vpn/amneziawg-tools.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}/src"

    make
}

package() {
    cd "${srcdir}/${_pkgname}/src"

    make DESTDIR="${pkgdir}/" install
}
