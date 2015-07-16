# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Majki <majki@majki.hu>
pkgname=tsclient2
pkgver=2.0.1
pkgrel=10
pkgdesc="Terminal Server Client [tsclient] is a GTK2 frontend for rdesktop and other remote desktop tools."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tsclient"
license=('GPL')
depends=('gnome-desktop2' 'libgnomeui' 'libnm-glib' 'desktop-file-utils')
makedepends=('sharutils')
conflicts=('tsclient')
source=(http://downloads.sourceforge.net/sourceforge/tsclient/tsclient-$pkgver.tar.bz2)
md5sums=('3de7131156f37c5ef1028a5f03ed021b')
install=${pkgname}.install

build() {
  cd "$srcdir/tsclient-$pkgver"

  sed -i '/PKG_CONFIG.*libgnome-2.0/s/libgnome-2.0/libgnome-2.0\ libgnomeui-2.0/' configure
  sed -i '/Exec/s/.*/Exec=tsclient/' data/tsclient.desktop.in
  sed -i '/notify_notification_new/s/, NULL//' src/plugins/default/tsc-rdp-connection.c
  sed -i '/notify_notification_new/s/, NULL//' src/plugins/default/tsc-vnc-connection.c
  sed -i 's/libnm_glib/libnm-glib/g' configure
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/tsclient-$pkgver"
  make DESTDIR="$pkgdir" install
}

