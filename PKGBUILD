# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.0.2
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("libnm-gtk" 'openvpn' 'gtk3' 'libsecret')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
install=networkmanager-openvpn.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/${pkgver::3}/NetworkManager-openvpn-${pkgver}.tar.xz)
sha256sums=('1643824bc7fdab42e1dab836bf81c328692295c86f146bde602eca093b394bb0')

build() {
  cd NetworkManager-openvpn-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/networkmanager \
    --enable-more-warnings=yes \
    --disable-static
  make
}

package() {
  cd NetworkManager-openvpn-${pkgver}
  make DESTDIR="${pkgdir}" install
}
