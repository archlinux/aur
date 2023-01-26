# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Maintainer: Vladimir Buianov (larrabee) <kafatron@gmail.com>

pkgname=openvpn-dco-dkms
pkgver=0.1.20221107
_dco_commit=3b3df4a3abadfbb8c903469d08e51f577e8e3bd7
pkgrel=1
pkgdesc='Optional Data Channel Offload kernel module for OpenVPN 2.6'
arch=('any')
url='https://github.com/OpenVPN/ovpn-dco'
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('ovpn-dco' 'ovpn-dco-dkms')
conflicts=('ovpn-dco' 'ovpn-dco-git' 'ovpn-dco-dkms-git')
source=("ovpn-dco-${_dco_commit}.tar.gz::https://github.com/OpenVPN/ovpn-dco/archive/${_dco_commit}.tar.gz"
        dkms.conf.in)
b2sums=('32ac9df8dad5463cc235877ecc91e7d1f6b2ca0bdb98081547dab5972a6a7a99dcbac70d72a70f134308b88cd48076f63bedd894f7ebbf08aa99ba33720e24e6'
        'ef58d221d70302cc41831e7ef3337954510540f2d59d85cb1f2767ee718324ad5568544053f64b7de00377d9620bb9f6df1ed1befcefabfc5530bec317ffde47')

package() {
	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/src/ovpn-dco-${pkgver}"
	cp -r "${srcdir}/ovpn-dco-${_dco_commit}"/* "${pkgdir}/usr/src/ovpn-dco-${pkgver}"

	sed -e "s/@PKGVER@/${pkgver}/" "${srcdir}/dkms.conf.in" > "${srcdir}/dkms.conf"
	install -Tm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ovpn-dco-${pkgver}/dkms.conf"
}
