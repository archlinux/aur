# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: OK100 <ok100.ok100.ok100@gmail.com>

pkgname=zenity-gtk2
pkgver=2.32.1
pkgrel=3
pkgdesc="Display graphical dialog boxes from shell scripts. GTK2 version."
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2' 'libnotify')
makedepends=('intltool' 'gtk-doc')
conflicts=('zenity')
provides=('zenity')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/zenity/${pkgver%.*}/zenity-${pkgver}.tar.gz
        notify_notification_new.patch)
sha256sums=('75d858e5f0bdcb4de7ec6b753370b46da69af69462208cebca2c144c824808d1'
            'efea2489756ac9c126dcd81d071c1efa331966942f8ece7a2cb55fd9168115e4')

build() {
  cd "${srcdir}/zenity-${pkgver}/src"
  patch < "${srcdir}/notify_notification_new.patch"
  cd "${srcdir}/zenity-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd "${srcdir}/zenity-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
