# Maintainer: tobias <tobias@archlinux.org>

pkgname=gtk-sharp-2
pkgver=2.12.1
pkgrel=1
pkgdesc="gtk2 bindings for C#"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk-sharp.sourceforge.net"
depends=('mono>=1.9' 'libglade>=2.6.2' 'gtk2>=2.12.9-2')
makedepends=('pkgconfig' 'monodoc')
conflicts=('gtk#')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/GNOME/sources/gtk-sharp/2.12/gtk-sharp-${pkgver}.tar.bz2)
md5sums=('b769fabc114fa9201c4e085ae36a8540')

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
