# Maintainer: Ionut Biru <ionut@archlinux.ro>

pkgname=networkmanager-openvpn
pkgver=0.8
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager>=0.8' 'openvpn')
makedepends=('intltool' 'gtk2' 'libglade' 'gconf' 'gnome-keyring')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
install=networkmanager-openvpn.install
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/0.8/NetworkManager-openvpn-${pkgver}.tar.bz2)
sha256sums=('8fd6f25093ade66a98ce1327f24ef953351aabf02870c5dcf12500a6b7f08d43')

build() {
  cd "${srcdir}/NetworkManager-openvpn-${pkgver}"
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
