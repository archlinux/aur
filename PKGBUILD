# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
_pkgbasename=v4l-utils
pkgname=lib32-$_pkgbasename
pkgver=1.6.0
pkgrel=1
pkgdesc="Userspace tools and conversion library for Video 4 Linux (32-bit)"
arch=('x86_64')
url="http://linuxtv.org/"
provides=("lib32-libv4l=$pkgver")
replaces=('lib32-libv4l')
conflicts=('lib32-libv4l')
license=('LGPL')
makedepends=('gcc-multilib')
depends=('lib32-gcc-libs' $_pkgbasename lib32-libjpeg-turbo)
source=(http://linuxtv.org/downloads/v4l-utils/${_pkgbasename}-${pkgver}.tar.bz2
        http://linuxtv.org/downloads/v4l-utils/${_pkgbasename}-${pkgver}.tar.bz2.asc)
sha256sums=('6054d3120c67a1524993e699b3b02036c817bb000b742c332682163966dc7605'
            'SKIP')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc
  make -C lib
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  MAKEFLAGS="-j1" make -C lib install DESTDIR="${pkgdir}/"
  rm -rf "${pkgdir}"/{usr/{include,share,bin,sbin},etc,lib}
}
