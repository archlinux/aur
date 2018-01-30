# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Nathan Phillip Brink <binki@gentoo.org>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=libstrl
pkgver=0.5.1
pkgrel=2
pkgdesc="Implementations of certain GNU-only or BSD-only string-related libc functions, such as strlcpy() and getdelim(), for compat purposes"
# TODO: What's the right URL? (source URL (mirror) still works, though
url="http://ohnopub.net/~ohnobinki/libstrl"
license=('LGPL3')
arch=(x86_64)
depends=()
makedepends=(doxygen libtool pkg-config)
options=(!libtool)
validpgpkeys=('184B7CEB69B57FD42BAF9AF9743A52E86BA81050')
source=(ftp://mirror.ohnopub.net/mirror/${pkgname}-${pkgver}.tar.bz2{,.asc})
sha512sums=('c79b37aef2cf909529e3afabdf472730f9df2eb3605eeb41a74b56f1c9c43a5be1f23c7f383c4b1c2aacb81b9df1d455a3fe9ec1083d5fcabae4c82ef916df92'
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
  # hrauch: really needed? Besides, file is still named man/man0/strl.h.0...
  #sed -i 's|man0/strl.h.0|man30/strl.h.30|g' Makefile
  install -Dm0644 man/man0/strl.h.0 "$pkgdir"/usr/share/man/man0/strl.h.0

  make DESTDIR="${pkgdir}" install
}
