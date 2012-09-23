# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=libxml2
pkgname=libx32-$_pkgbasename
pkgver=2.8.0
pkgrel=1.1
pkgdesc="XML parsing library, version 2 (x32 ABI)"
arch=(x86_64)
license=('custom')
depends=('libx32-zlib>=1.2.4' 'libx32-readline>=6.1' 'libx32-ncurses>=5.7' 'python2-x32' $_pkgbasename)
makedepends=(gcc-multilib-x32)
options=('!libtool')
url="http://www.xmlsoft.org/"
source=(ftp://ftp.xmlsoft.org/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('c62106f02ee00b6437f0fb9d370c1093')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr --with-threads --with-history --libdir=/usr/libx32 --without-lzma --with-python=/opt/python2-x32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin} "$pkgdir/usr/libx32/xml2Conf.sh"
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
