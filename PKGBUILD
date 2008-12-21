# Maintainer: tobias <tobias@archlinux.org>

pkgname=gtk-sharp-2
pkgver=2.12.7
pkgrel=1
pkgdesc="gtk2 bindings for C#"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk-sharp.sourceforge.net"
depends=('mono>=2.0.1' 'libglade>=2.6.3' 'gtk2>=2.14.6')
makedepends=('pkgconfig' 'monodoc')
conflicts=('gtk#')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/GNOME/sources/gtk-sharp/2.12/gtk-sharp-${pkgver}.tar.bz2)
md5sums=('e3f2ac276832829d7089352f014c4c6f')

build() {
 # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR="${srcdir}/weird"
  mkdir -p "${MONO_SHARED_DIR}"

  cd "${srcdir}/gtk-sharp-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static || return 1
  make || return 1
  make GACUTIL="/usr/bin/gacutil /root ${pkgdir}/usr/lib" \
     	 DESTDIR="${pkgdir}" install || return 1
}
