# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Maintainer: Vladimir Buianov (larrabee) <kafatron@gmail.com>

pkgname=openvpn-dco-dkms
pkgver=0.2.20230426
_dco_commit=961c60d0d8b8d45a21028e0479397c9c5604b81e
pkgrel=1
pkgdesc='Optional Data Channel Offload kernel module for OpenVPN 2.5'
arch=('any')
url='https://github.com/OpenVPN/ovpn-dco'
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('ovpn-dco' 'ovpn-dco-dkms')
conflicts=('ovpn-dco' 'ovpn-dco-git' 'ovpn-dco-dkms-git')
source=("ovpn-dco-${_dco_commit}.tar.gz::https://github.com/OpenVPN/ovpn-dco/archive/${_dco_commit}.tar.gz"
        dkms.conf.in)
b2sums=('67576d4bd726fd9cf6f3a107dbc0d1150507942118f50f3867a690c87387ee0c5d10beb4cf88a94768f9bfe3d6a99cc16e8e53a1de06f35bfff9b6ff7bbb6301'
        'ef58d221d70302cc41831e7ef3337954510540f2d59d85cb1f2767ee718324ad5568544053f64b7de00377d9620bb9f6df1ed1befcefabfc5530bec317ffde47')

package() {
	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/src/ovpn-dco-${pkgver}"
	cp -r "${srcdir}/ovpn-dco-${_dco_commit}"/* "${pkgdir}/usr/src/ovpn-dco-${pkgver}"

	sed -e "s/@PKGVER@/${pkgver}/" "${srcdir}/dkms.conf.in" > "${srcdir}/dkms.conf"
	install -Tm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ovpn-dco-${pkgver}/dkms.conf"
}
