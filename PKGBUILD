# Maintainer: Nicolas Stinus <nicolas.stinus@gmail.com>

pkgname=openvpn-nordvpn
pkgver=0.1.1
pkgrel=1
pkgdesc="OpenVPN helper script for nordvpn.com"
arch=(any)
url="https://github.com/nstinus/nordvpn"
license=('MIT')
depends=('openvpn'
         'systemd'
         'openvpn-update-resolv-conf-git'
         'curl'
         'unzip'
         'sudo'
         'coreutils')
optdepends=('iputils: run ping and rank functions'
            'vpnfailsafe-git: use instead of update-resolv-conf if available')
makedepends=('coreutils')
provides=('nordvpn')
source=('git+https://github.com/nstinus/nordvpn.git#branch=master')
sha1sums=('SKIP')
install=${pkgname}.install

pkgver() {
    git --git-dir $(pwd)/nordvpn/.git describe --always --long --match "v?.?" \
        | sed 's/-/./' \
        | cut -d '-' -f 1 \
        | sed 's/v//'
}

package() {
    install -D -m 755 nordvpn/nordvpn $pkgdir/usr/bin/nordvpn
}
