# Maintainer: Cyrinux <cyril@levis.name>

pkgname=networkmanager-openvpn-ncp-disable-git
pkgver=0.r1245.g175585d
pkgrel=1
pkgdesc='NetworkManager VPN plugin for OpenVPN with ncp-disable patch - git checkout'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.gnome.org/projects/NetworkManager/'
depends=('libnm-gtk' 'openvpn' 'libsecret' 'libnma')
makedepends=('git' 'intltool' 'python')
provides=('networkmanager-openvpn')
conflicts=('networkmanager-openvpn')
source=('git+https://github.com/cyrinux/network-manager-openvpn.git#branch=add-ncp-disable-support')
sha256sums=('SKIP')

pkgver() {
	cd network-manager-openvpn/

	printf '0.r%s.g%s' \
			"$(git rev-list --count add-ncp-disable-support)" \
			"$(git rev-parse --short HEAD)"
}
build() {
	cd network-manager-openvpn/

	./autogen.sh
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--libexecdir=/usr/lib/networkmanager \
		--enable-more-warnings=yes \
		--disable-static
	make
}

package() {
	cd network-manager-openvpn/

	make DESTDIR="${pkgdir}" install
}
