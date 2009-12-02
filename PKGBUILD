# Maintainer: Ionut Biru <ionut@archlinux.ro>

pkgname=networkmanager-openvpn
pkgver=0.7.2
pkgrel=3
pkgdesc="NetworkManager VPN plugin for OpenVPN"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager>=0.7.2' 'openvpn')
makedepends=('intltool' 'gtk2' 'libglade' 'gconf' 'gnome-keyring')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
install=networkmanager-openvpn.install
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/0.7/NetworkManager-openvpn-${pkgver}.tar.bz2)
sha256sums=('cce2deb114f55559f6c2f2fd5ddb3b12a4812549a5354ea92c65c42d8e67a47f')

build() {
  cd "${srcdir}/NetworkManager-openvpn-${pkgver}"
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
