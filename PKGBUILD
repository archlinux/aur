# $Id: PKGBUILD 179569 2013-03-07 11:54:27Z foutrelis $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openconnect-gtk2
_pkgname=networkmanager-openconnect
pkgver=0.9.8.2
pkgrel=1
pkgdesc="NetworkManager VPN integration for openconnect"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver::5}" 'openconnect' 'gconf' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=('!libtool')
install=$_pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openconnect/0.9/NetworkManager-openconnect-${pkgver}.tar.xz)
sha256sums=('8c3b393d155448d41f5de539d4920f0e5205a087aa5b25ed65601d6a370c44eb')

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
