# Maintaoner: Yamada Hayao <development@fascode.net>

_pkgname="nm-vpngate"
pkgname="${_pkgname}-git"
pkgver=r87.49fdf34
pkgrel=1
pkgdesc="A script that makes it easy to connect Network Manager to a VPN Gate"
arch=('any')
url="https://github.com/Hayao0819/nm-vpngate"
license=('WTFPL')
depends=("networkmanager" "networkmanager-openvpn" "networkmanager-strongswan" "zenity" "networkmanager-l2tp")
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')
install="nm-vpngate.install"

pkgver() {
    cd "${_pkgname}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
