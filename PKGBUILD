# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Maintainer: Vladimir Buianov (larrabee) <kafatron@gmail.com>

pkgname=openvpn-dco-dkms
pkgver=0.2.20230818
_dco_commit=dba96d203f960356b477291d6a58d30fc096fbe4
pkgrel=1
pkgdesc='Optional Data Channel Offload kernel module for OpenVPN 2.5'
arch=('any')
url='https://github.com/OpenVPN/ovpn-dco'
license=('GPL2')
depends=('dkms')
provides=('ovpn-dco' 'ovpn-dco-dkms')
conflicts=('ovpn-dco' 'ovpn-dco-git' 'ovpn-dco-dkms-git')
source=("ovpn-dco-${_dco_commit}.tar.gz::https://github.com/OpenVPN/ovpn-dco/archive/${_dco_commit}.tar.gz"
        dkms.conf.in)
b2sums=('6848c40382880ea1256b82370eb0f7341a62d228aa1de76b6c50df6ba243f5f8a9d6de21201c4f3ee5fc1008732f4daed5d01eb361a9776220de124fbd394b80'
        '59ead5244548662b6cc8ff4e592138accba0d09b2996248cee217ec47fdb9fae565ae43ce32cb23a88f4e152bf0205ce3467de2f2090c4a1104382b68585931d')

package() {
	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/src/ovpn-dco-${pkgver}"
	cp -r "${srcdir}/ovpn-dco-${_dco_commit}"/* "${pkgdir}/usr/src/ovpn-dco-${pkgver}"

	sed -e "s/@PKGVER@/${pkgver}/" "${srcdir}/dkms.conf.in" > "${srcdir}/dkms.conf"
	install -Tm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ovpn-dco-${pkgver}/dkms.conf"
}
