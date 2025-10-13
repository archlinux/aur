# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
# Maintainer 2021-2025: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=ovpn-dco-dkms
pkgver=0.2.20250922
pkgrel=2
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
b2sums=('890d0086da7e8303aeeb361a98bbd4cecd1654c153ab6715f512550a34ca247a17a2da8cd037032a9d3e67e72a092f60d6803dd1fa065350c0475d07c940be8d'
        '4c4d9ef50500f76766861dd7037974b71f3d7183897095e78d91db7ec6416e7d43e2a6bbb9f2625143845b5762f1ebc12b559b909944948d27deb26bb9c96226')

build() {
    sed -e "s/@PKGVER@/${pkgver}/" dkms.conf.in > dkms.conf
}

package() {
    mkdir -p "${pkgdir}/usr/src"
    cp -rt "${pkgdir}/usr/src/" "ovpn-dco-${pkgver}"
    install -m644 -t "${pkgdir}/usr/src/ovpn-dco-${pkgver}/" dkms.conf
}
