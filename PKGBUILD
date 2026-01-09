# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
# Maintainer 2021-2025: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=ovpn-dco-dkms
pkgver=0.2.20251017
pkgrel=1
epoch=1
pkgdesc='Optional Data Channel Offload kernel module for OpenVPN 3'
arch=('any')
url='https://github.com/OpenVPN/ovpn-dco'
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=('ovpn-dco' 'ovpn-dco-dkms')
conflicts=('ovpn-dco' 'ovpn-dco-git' 'ovpn-dco-dkms-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        dkms.conf.in)
b2sums=('489edffffa23f2bae6e27934a26803c25ed34489ee8b245a6356e9772936d492baa0c45e67c982bc89b1ae64ad98e47f989e06e4fb149ae5bc538fb316da1042'
        '4c4d9ef50500f76766861dd7037974b71f3d7183897095e78d91db7ec6416e7d43e2a6bbb9f2625143845b5762f1ebc12b559b909944948d27deb26bb9c96226')

build() {
    sed -e "s/@PKGVER@/${pkgver}/" dkms.conf.in > dkms.conf
}

package() {
    mkdir -p "${pkgdir}/usr/src"
    cp -rt "${pkgdir}/usr/src/" "ovpn-dco-${pkgver}"
    install -m644 -t "${pkgdir}/usr/src/ovpn-dco-${pkgver}/" dkms.conf
}
