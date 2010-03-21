# Maintainer: tobias <tobias@archlinux.org>

pkgname=gtk-sharp-2
pkgver=2.12.10
pkgrel=1
pkgdesc="gtk2 bindings for C#"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk-sharp.sourceforge.net"
depends=('mono>=2.4' 'libglade>=2.6.4' 'gtk2>=2.18.0')
makedepends=('pkgconfig' 'monodoc')
conflicts=('gtk#')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/GNOME/sources/gtk-sharp/2.12/gtk-sharp-${pkgver}.tar.bz2)
sha256sums=('aaa53f7916f25f0f83760b6ffbf0d465d13ecfa55aa645603f1ca876b7d0f770')

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
