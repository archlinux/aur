#$Id: $
#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=2.30.0
pkgrel=2
pkgdesc="GNOME keyring client library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('eggdbus' 'libgcrypt' 'gnome-keyring>=2.30.0')
makedepends=('intltool' 'pkgconfig' 'python')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.30/${pkgname}-${pkgver}.tar.bz2
	fix_endless_loop.patch)
sha256sums=('11e64445537a8fab367875d1ae4aa00db9227c4db384c5d019cfa85c977b40ec'
	    '6e53216a8fae3e4c4888a44ff14e80fe540b9f21ef3276976cc78928d99cf9b7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/fix_endless_loop.patch" || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring || return 1
  make || return 1
  make -j1 DESTDIR="${pkgdir}" install || return 1
}
