# $Id: PKGBUILD 166519 2012-09-09 15:40:55Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openconnect-gtk2
pkgver=0.9.6.2
pkgrel=1
pkgdesc="NetworkManager VPN integration for openconnect"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver::5}" 'openconnect' 'gtk2' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
provides=('networkmanager-openconnect')
conflicts=('networkmanager-openconnect')
options=('!libtool')
install=networkmanager-openconnect.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openconnect/0.9/NetworkManager-openconnect-${pkgver}.tar.xz)
sha256sums=('3f53d87dbeb00fc841ef5981e6f1a1a192c65d273386246d48245cca84fa41b0')

build() {
  cd NetworkManager-openconnect-${pkgver}
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static \
	--with-gtkver=2 \
	--enable-more-warnings=no
  make
}

package() {
  cd NetworkManager-openconnect-${pkgver}
  make DESTDIR="${pkgdir}" install
}
