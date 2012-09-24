# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=libxrender
pkgname=libx32-$_pkgbasename
pkgver=0.9.7
pkgrel=1.1
pkgdesc="X Rendering Extension client library (x32 ABI)"
arch=('x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libx32-libx11>=1.3.4' $_pkgbasename)
makedepends=('pkgconfig' 'gcc-multilib-x32' renderproto)
options=('!libtool')
source=(${url}/releases/individual/lib/libXrender-${pkgver}.tar.bz2)
sha1sums=('6e4d75d8316d5217324258f555eba3a5d383feb2')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/libXrender-${pkgver}"
  ./configure --prefix=/usr --disable-static --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXrender-${pkgver}"

  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
