# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Nathan Phillip Brink <binki@gentoo.org>

pkgname=libstrl
pkgver=0.5.1
pkgrel=1
pkgdesc="Implementations of certain GNU-only or BSD-only string-related libc functions, such as strlcpy() and getdelim(), for compat purposes"
url="http://ohnopub.net/~ohnobinki/libstrl"
license=('LGPL3')
arch=(x86_64)
depends=()
makedepends=(doxygen libtool pkg-config)
options=(!libtool)
validpgpkeys=('184B7CEB69B57FD42BAF9AF9743A52E86BA81050')
source=(ftp://mirror.ohnopub.net/mirror/${pkgname}-${pkgver}.tar.bz2{,.asc})
md5sums=('d22fcd8107526d802428be6f0e8f0f60'
         'SKIP')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-doxygen
  make
}

check() {
  make -C "${srcdir}"/${pkgname}-${pkgver} check
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # doxygen workaround
  sed -i 's|man0/strl.h.0|man30/strl.h.30|g' Makefile
  install -Dm0644 man/man30/strl.h.30 "$pkgdir"/usr/share/man/man0/strl.h.0

  make DESTDIR="${pkgdir}" install
}
