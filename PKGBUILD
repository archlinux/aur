# Maintainer: tobias <tobias@archlinux.org>

pkgname=gtk-sharp-2
pkgver=2.12.6
pkgrel=1
pkgdesc="gtk2 bindings for C#"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk-sharp.sourceforge.net"
depends=('mono>=2.0.1' 'libglade>=2.6.3' 'gtk2>=2.14.4')
makedepends=('pkgconfig' 'monodoc')
conflicts=('gtk#')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/GNOME/sources/gtk-sharp/2.12/gtk-sharp-${pkgver}.tar.bz2)
md5sums=('3c515cbe0aee70e988f02457c621f693')

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
