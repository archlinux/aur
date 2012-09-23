# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=libxdmcp
pkgname=libx32-$_pkgbasename
pkgver=1.1.1
pkgrel=1.1
pkgdesc="X11 Display Manager Control Protocol library (x32 ABI)"
arch=(x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libx32-glibc' $_pkgbasename)
makedepends=('xorg-util-macros' 'gcc-multilib-x32')
options=('!libtool')
source=(${url}/releases/individual/lib/libXdmcp-${pkgver}.tar.bz2)
sha1sums=('3b63e8fc1600c51d9897d017da190fc6c16245b6')

build() {
  cd ${srcdir}/libXdmcp-${pkgver}

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-static \
              --libdir=/usr/libx32
  make
}

package() {
  cd ${srcdir}/libXdmcp-${pkgver}

  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname" 
}
