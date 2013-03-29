# $Id: PKGBUILD 179571 2013-03-07 11:54:28Z foutrelis $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-pptp-gtk2
_pkgname=networkmanager-pptp
pkgver=0.9.8.0
pkgrel=1
pkgdesc="NetworkManager VPN plugin for pptp "
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=("networkmanager>=${pkgver}" 'pptpclient' 'gtk2' 'libgnome-keyring')
makedepends=('intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
options=('!libtool')
provides=($_pkgname)
conflicts=($_pkgname)
install=networkmanager-pptp.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-pptp/0.9/NetworkManager-pptp-${pkgver}.tar.xz
        gtk_table_to_gtk_grid.patch)
sha256sums=('34d0981462d8948ace0dd4f49478c86017b53516afbbf62e2a4c6c0adc679cc8'
            '17c194c605bca780bf657711e9cff910c63ab27eae70c11cb6c53e9c75ad3215')

build() {
  cd NetworkManager-pptp-${pkgver}
#  patch -Np1 -i ../gtk_table_to_gtk_grid.patch
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
