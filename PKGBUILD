# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Thomas Haider <t.haider@vcnc.org>

pkgname=libev-static
_pkgname=libev
pkgver=4.33
pkgrel=1
pkgdesc="A full-featured and high-performance event loop (static library)"
arch=('i686' 'x86_64')
url="http://software.schmorp.de/pkg/libev.html"
license=('BSD')
depends=('glibc')
optdepends=('libev: headers and pkg-config files')
source=(http://dist.schmorp.de/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha1sums=('133587b89c34dba0b3a2d2a90ba59f6748f6c368')
options=('staticlibs')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/share
  rm -f ${pkgdir}/usr/lib/*.so*

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
