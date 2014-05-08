# $Id: PKGBUILD 194798 2013-09-23 17:24:22Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-pptp-gtk2
_pkgname=networkmanager-pptp
pkgver=0.9.8.4
pkgrel=1
pkgdesc="NetworkManager VPN plugin for pptp "
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver::5}" 'pptpclient' 'gtk2' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
options=('!libtool')
provides=($_pkgname)
conflicts=($_pkgname)
install=networkmanager-pptp.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-pptp/0.9/NetworkManager-pptp-${pkgver}.tar.xz
        gtk_table_to_gtk_grid.patch)
sha256sums=('97ba8f6f726056c3b8e0e1c8d2ab3d32791cadd7c3a38e0478fb2bd3ecafdce8'
            '17c194c605bca780bf657711e9cff910c63ab27eae70c11cb6c53e9c75ad3215')

prepare() {
  cd NetworkManager-pptp-${pkgver}
#  patch -Np1 -i ../gtk_table_to_gtk_grid.patch
}

build() {
  cd NetworkManager-pptp-${pkgver}
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static \
	--with-gtkver=2 \
	--enable-more-warnings=no
  make
}

package() {
  cd NetworkManager-pptp-${pkgver}
  make DESTDIR="${pkgdir}" install
}
