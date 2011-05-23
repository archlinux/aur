#$Id$
#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=3.0.2
pkgrel=2
pkgdesc="GNOME keyring client library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('dbus-core' 'libgcrypt' 'glib2')
makedepends=('intltool' 'pkgconfig')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2
        fix_crash.patch)
sha256sums=('7914ac5edae5e602ba8f7c505ecd18faa84e8482a3f4e6ee0a20aee3a24d6f5d'
            '4b8c3d9cbc72d171b274e9ad38b01ff9f7ce92beaf1d1e89c54db70d6c4e8a6a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/fix_crash.patch"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
