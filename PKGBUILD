#$Id: $
#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=2.29.4
pkgrel=1
pkgdesc="GNOME keyring client library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('eggdbus' 'libgcrypt' 'gnome-keyring>=2.29.90')
makedepends=('intltool' 'pkgconfig' 'python')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.29/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('6f15c1839a95628ee85293b5ae0873a8a71204d570dc15d84dd59adff928b82a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring || return 1
  make || return 1
  make -j1 DESTDIR="${pkgdir}" install || return 1
}
