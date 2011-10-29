# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=0.9.1.95
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver}" 'openvpn' 'gtk3' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
install=networkmanager-openvpn.install
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/0.9/NetworkManager-openvpn-${pkgver}.tar.xz)
sha256sums=('2c988bfcfe8bc011a26cd2e7f58ea528ef6d923d4af74d5c7633dd26d1bb792f')

build() {
  cd "${srcdir}/NetworkManager-openvpn-${pkgver}"
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static
  make
}

package() {
  cd "${srcdir}/NetworkManager-openvpn-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
