#$Id$
#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=2.30.1
pkgrel=1
pkgdesc="GNOME keyring client library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('eggdbus>=0.6' 'libgcrypt>=1.4.5' 'gnome-keyring>=2.30.1')
makedepends=('intltool' 'pkgconfig' 'python')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.30/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('a9227da7d3eee930b75ad7858875344b713d1bf73e6af54870a2691643d5dae4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring || return 1
  make || return 1
  make -j1 DESTDIR="${pkgdir}" install || return 1
}
