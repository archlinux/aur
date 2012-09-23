# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>
_pkgbasename=libxft
pkgname=libx32-$_pkgbasename
pkgver=2.3.1
pkgrel=1.1
pkgdesc="FreeType-based font drawing library for X (x32 ABI)"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libx32-fontconfig' 'libx32-libxrender')
makedepends=('gcc-multilib-x32')
options=('!libtool')
source=(${url}/releases/individual/lib/libXft-${pkgver}.tar.bz2)
sha256sums=('7fce32b92dcb7b2869bed567af2abc7bbad0d5d6fcf471b8a3e137964a31bbbd')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${srcdir}/libXft-${pkgver}
  ./configure --prefix=/usr \
    --libdir=/usr/libx32 --disable-static
  make
}

package() {
  cd "${srcdir}/libXft-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
