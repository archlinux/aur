# $Id: PKGBUILD 88966 2010-08-26 18:32:27Z thomas $
# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
_pkgbasename=v4l-utils
pkgname=lib32-$_pkgbasename
pkgver=0.8.4
pkgrel=1
pkgdesc="Userspace tools and conversion library for Video 4 Linux (32-bit)"
arch=('x86_64')
url="http://freshmeat.net/projects/libv4l"
provides=("lib32-libv4l=$pkgver")
replaces=('lib32-libv4l')
conflicts=('lib32-libv4l')
license=('LGPL')
makedepends=('gcc-multilib')
depends=('lib32-gcc-libs' $_pkgbasename lib32-libjpeg-turbo)
source=(http://linuxtv.org/downloads/v4l-utils/${_pkgbasename}-${pkgver}.tar.bz2)
sha256sums=('20bf73b0c2255dfc6ae82806ec8a663e00ab039df9ee6eadae633466841c0dd7')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  sed -i 's|CFLAGS :=|CFLAGS ?=|' Make.rules

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  make PREFIX=/usr LIBDIR=/usr/lib32
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make install PREFIX=/usr LIBDIR=/usr/lib32 DESTDIR="${pkgdir}/"
  rm -rf "${pkgdir}"/{usr/{include,share,bin,sbin},etc,lib}
}
