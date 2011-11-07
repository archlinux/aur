# Maintainer: tobias <tobias@archlinux.org>

pkgname=gtk-sharp-2
pkgver=2.12.11
pkgrel=1
pkgdesc="gtk2 bindings for C#"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk-sharp.sourceforge.net"
depends=('mono' 'libglade' 'gtk2')
makedepends=('pkgconfig' 'monodoc')
conflicts=('gtk#')
options=('!libtool' '!makeflags')
source=(http://download.mono-project.com/sources/gtk-sharp212/gtk-sharp-${pkgver}.tar.bz2)
md5sums=('c278da6a472c6c13b698af012f543c64')

build() {
 # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR="${srcdir}/wapi"
  mkdir -p "${MONO_SHARED_DIR}"

  cd "${srcdir}/gtk-sharp-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd "${srcdir}/gtk-sharp-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
