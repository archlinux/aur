# Maintainer: PitBall

pkgname=libnotify-gtk2
pkgver=0.7.6
pkgrel=2
pkgdesc="Library for sending desktop notifications"
arch=('x86_64' 'i686')
url="https://developer.gnome.org/notification-spec/"
license=('LGPL')
depends=('gdk-pixbuf2')
makedepends=('gtk2' 'gobject-introspection' 'gtk-doc')
conflicts=('libnotify' 'libnotify-git' 'libnotify-id' 'libnotify-id-git')
provides=("libnotify=$pkgver")
replaces=('libnotify')

source=("http://ftp.gnome.org/pub/GNOME/sources/${pkgname/-gtk2/}/0.7/${pkgname/-gtk2/}-${pkgver}.tar.xz")
sha256sums=('0ef61ca400d30e28217979bfa0e73a7406b19c32dd76150654ec5b2bdf47d837')

build() {
  cd ${srcdir}/${pkgname/-gtk2/}-${pkgver}
  # Force use GTK-2.0
  sed -e 's/2.90/2.24/' -e 's/gtk+-3.0/gtk+-2.0/' -i configure.ac
  autoreconf -fi
  export ACLOCAL=aclocal
  export AUTOMAKE=automake
  export CC="gcc -m64"
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
  ./configure --prefix=/usr --enable-gtk-doc
  make
}

package() {
  cd ${srcdir}/${pkgname/-gtk2/}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
