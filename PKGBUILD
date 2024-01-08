# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Maintainer: Vladimir Buianov (larrabee) <kafatron@gmail.com>

pkgname=openvpn-dco-dkms
pkgver=0.2.20231117
_dco_commit=f2a8a332a9cf85eddca3fa7df622ddec56a8e77c
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
sha256sums=('2673205e2e03b3f0ac507381e9a8954049a40f32cdb3ccebe70a5b025dc521e1'
            'da5054fe94a17918ad0674b8359cb5888d4382cdac5f3caaa55e5aa213585b5c')


package() {
	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/src/ovpn-dco-${pkgver}"
	cp -r "${srcdir}/ovpn-dco-${_dco_commit}"/* "${pkgdir}/usr/src/ovpn-dco-${pkgver}"

	sed -e "s/@PKGVER@/${pkgver}/" "${srcdir}/dkms.conf.in" > "${srcdir}/dkms.conf"
	install -Tm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ovpn-dco-${pkgver}/dkms.conf"
}
