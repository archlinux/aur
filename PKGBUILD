# Maintainer: PitBall

_pkgname=libnotify
pkgname=lib32-${_pkgname}-gtk2
pkgver=0.7.6
pkgrel=1
pkgdesc="Desktop notification library 32bit"
arch=('i686' 'x86_64')
url="http://library.gnome.org/devel/notification-spec/"
license=('LGPL')
depends=('libnotify-gtk2' 'lib32-gdk-pixbuf2' 'lib32-gtk2' )
conflicts=('lib32-libnotify' 'lib32-libnotify-git' 'lib32-libnotify-id' 'lib32-libnotify-id-git')
provides=("lib32-libnotify=$pkgver")
replaces=('lib32-libnotify')
source=("http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/0.7/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('0ef61ca400d30e28217979bfa0e73a7406b19c32dd76150654ec5b2bdf47d837')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  # Force use GTK-2.0
  sed -e 's/2.90/2.24/' -e 's/gtk+-3.0/gtk+-2.0/' -i configure.ac
  autoreconf -fi
  export ACLOCAL=aclocal
  export AUTOMAKE=automake
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r ${pkgdir}/usr/{bin,include,share}
}
