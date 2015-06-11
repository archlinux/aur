# $Id: PKGBUILD 194799 2013-09-23 17:25:00Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-vpnc-gtk2
_pkgname=networkmanager-vpnc
pkgver=0.9.8.6
pkgrel=1
pkgdesc="NetworkManager VPN plugin for vpnc"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver%.*}" 'vpnc' 'hicolor-icon-theme' 'gtk2' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
options=('!libtool')
provides=($_pkgname)
conflicts=($_pkgname)
install=networkmanager-vpnc.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-vpnc/0.9/NetworkManager-vpnc-${pkgver}.tar.xz)
sha256sums=('40306cd713d4e6e9df6a520d2992664d22173b3327e94df45a6dac23f0a8abd6')

build() {
  cd NetworkManager-vpnc-${pkgver}
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static \
	--with-gtkver=2 \
	--enable-more-warnings=no
  make
}

package() {
  cd NetworkManager-vpnc-${pkgver}
  make DESTDIR="${pkgdir}" install
}
