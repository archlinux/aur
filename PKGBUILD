# $Id: PKGBUILD 88966 2010-08-26 18:32:27Z thomas $
# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
_pkgbasename=v4l-utils
pkgname=lib32-$_pkgbasename
pkgver=0.8.5
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
sha256sums=('c205848fbaf3489b97519dae04da31be4998bbc170a2ca9791357a8a549e594c')

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
