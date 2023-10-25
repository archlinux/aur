# Maintainer: uffe-at-uffe-dot-org

pkgname=djgpp-zlib
pkgver=1.3
pkgrel=1
pkgdesc="Compression library implementing the deflate compression method found in gzip and PKZIP (DJGPP)"
arch=(any)
license=("custom")
url="http://www.zlib.net/"
depends=(djgpp-djcrx)
makedepends=(djgpp-cmake)
options=(!strip !buildflags staticlibs)

source=("http://zlib.net/zlib-${pkgver}.tar.gz")
md5sums=('60373b133d630f74f4a1f94c1185a53f')

build()
{
  unset LDFLAGS
  cd zlib-${pkgver}
  i686-pc-msdosdjgpp-cmake -DASM686=ON
  make zlibstatic
}

package()
{
  cd zlib-${pkgver}
  install -Dm644 libzlibstatic.a "$pkgdir/usr/i686-pc-msdosdjgpp/lib/libz.a"
  install -Dm644 zconf.h "$pkgdir/usr/i686-pc-msdosdjgpp/include/zconf.h"
  install -m644 zlib.h "$pkgdir/usr/i686-pc-msdosdjgpp/include/"
  install -Dm644 zlib.pc "$pkgdir/usr/i686-pc-msdosdjgpp/lib/pkgconfig/zlib.pc"
  find "${pkgdir}" -name '*.a' -exec i686-pc-msdosdjgpp-strip -g {} \;
}

#
# EOF
#
