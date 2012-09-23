# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>
_pkgbasename=libxau
pkgname=libx32-$_pkgbasename
pkgver=1.0.7
pkgrel=1.1
pkgdesc="X11 authorisation library (x32 ABI)"
arch=(x86_64)
url="http://xorg.freedesktop.org/"
depends=('libx32-glibc' $_pkgbasename)
makedepends=('pkgconfig' 'xproto>=7.0.15' 'gcc-multilib-x32')
license=('custom')
options=('!libtool')
source=(${url}/releases/individual/lib/libXau-${pkgver}.tar.bz2)
sha1sums=('29c47207fd246425b906f525b2220235ce4cd0f6')

build() {
  cd "${srcdir}/libXau-${pkgver}"

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/libXau-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
