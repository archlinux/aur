# $Id: PKGBUILD 187898 2013-06-07 21:38:15Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-pptp-gtk2
_pkgname=networkmanager-pptp
pkgver=0.9.8.2
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
sha256sums=('7f46ea61376d13d03685eca3f26a26e0022f6e92e6f1fc356034ca9717eb6dac'
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
