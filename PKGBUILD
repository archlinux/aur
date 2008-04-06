# $Id: PKGBUILD,v 1.21 2008/03/27 20:00:09 daniel Exp $
# Maintainer: tobias <tobias@archlinux.org>

pkgname=gtk-sharp-2
pkgver=2.12.0
pkgrel=2
pkgdesc="gtk2 bindings for C#"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk-sharp.sourceforge.net"
depends=('mono>=1.9' 'libglade>=2.6.2' 'gtk2>=2.12.9')
makedepends=('pkgconfig' 'monodoc')
conflicts=('gtk#')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/GNOME/sources/gtk-sharp/2.12/gtk-sharp-${pkgver}.tar.bz2)
md5sums=('e04d634c55460b79c69d19c49648c6df')

build() {
 # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR=${startdir}/src/weird
  mkdir -p "${MONO_SHARED_DIR}"

  cd ${startdir}/src/gtk-sharp-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static || return 1
  make || return 1
  make GACUTIL="/usr/bin/gacutil /root ${startdir}/pkg/usr/lib" \
     	 DESTDIR=${startdir}/pkg install || return 1
}
