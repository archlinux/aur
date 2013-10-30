# Maintainer: tobias <tobias@archlinux.org>

pkgname=gtk-sharp-2
pkgver=2.12.22
pkgrel=1
pkgdesc="gtk2 bindings for C#"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk-sharp.sourceforge.net"
depends=('mono' 'libglade' 'gtk2')
makedepends=('pkgconfig' 'monodoc')
conflicts=('gtk#')
options=('!makeflags')
source=(https://github.com/mono/gtk-sharp/archive/${pkgver}.tar.gz)
md5sums=('0cdaef41857e29c23942a148c83122ac')

build() {
  export MONO_SHARED_DIR="${srcdir}/wapi"
  mkdir -p "${MONO_SHARED_DIR}"

  cd gtk-sharp-${pkgver}
  ./bootstrap-2.12 --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd gtk-sharp-${pkgver}
  make DESTDIR="${pkgdir}" install
}
