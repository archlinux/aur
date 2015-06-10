# $Id: PKGBUILD 194796 2013-09-23 17:23:08Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openconnect-gtk2
_pkgname=networkmanager-openconnect
pkgver=0.9.8.6
pkgrel=1
pkgdesc="NetworkManager VPN integration for openconnect"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver::5}" 'openconnect' 'libgnome-keyring' 'gtk2')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=('!libtool')
install=$_pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openconnect/0.9/NetworkManager-openconnect-${pkgver}.tar.xz)
sha256sums=('b549a9579b6aa189501bf0fcb046844c75bb1e5699ae5ddfca2296a58d0c9b07')

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
