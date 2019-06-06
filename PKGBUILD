# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libntru
pkgver=0.5
pkgrel=2
pkgdesc='C Implementation of NTRUEncrypt'
url='https://github.com/tbuktu/libntru'
arch=('i686' 'x86_64')
license=('custom:2-clause BSD')
depends=('glibc')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/tbuktu/libntru/archive/${pkgver}.tar.gz")
sha256sums=('e459c146cab5470e395f35377f14a39ccc5640d98d8a7ddd14bab41d5630d433')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS+=" -Wa,--noexecstack"
  LDFLAGS+=" -Wl,-z,noexecstack"
  make -f Makefile.linux
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -f Makefile.linux install DESTDIR="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
