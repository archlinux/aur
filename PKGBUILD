# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

_clientver=14
pkgname=ovpn-dco-dkms
pkgver=14_beta
pkgrel=1
pkgdesc='Optional Data Channel Offload kernel module for OpenVPN 3'
arch=('any')
url='https://github.com/OpenVPN/ovpn-dco'
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('ovpn-dco' 'ovpn-dco-dkms')
conflicts=('ovpn-dco' 'ovpn-dco-git' 'ovpn-dco-dkms-git')
source=("git+https://github.com/OpenVPN/ovpn-dco.git#tag=linux-client-v${_clientver}"
        dkms.conf.in)
b2sums=('SKIP'
        'ef58d221d70302cc41831e7ef3337954510540f2d59d85cb1f2767ee718324ad5568544053f64b7de00377d9620bb9f6df1ed1befcefabfc5530bec317ffde47')

package() {
	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/src/ovpn-dco-${pkgver}"
	cp -r "${srcdir}/ovpn-dco"/* "${pkgdir}/usr/src/ovpn-dco-${pkgver}"

	sed -e "s/@PKGVER@/${pkgver}/" "${srcdir}/dkms.conf.in" > "${srcdir}/dkms.conf"
	install -Tm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ovpn-dco-${pkgver}/dkms.conf"
}
