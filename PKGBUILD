# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.0.6
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
sha256sums=('c982b644fa43d3019cb654a17e692bb3a7175a86d28065ea51f55ae7dfe45d8c')

prepare() {
  cd NetworkManager-openvpn-${pkgver}
}

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
