# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

_pkgbasename=libjson
pkgname=lib32-$_pkgbasename
pkgver='0.8'
pkgrel='1'
pkgdesc="Small C library and small codebase that packs an efficient parser and a configurable printer (32-bit version)"
arch=('x86_64')
url="https://projects.snarc.org/libjson/"
license=('LGPL')
depends=(lib32-glibc $_pkgbasename)
makedepends=(gcc-multilib)
options=(!libtool !makeflags)
source=("https://projects.snarc.org/libjson/download/libjson-${pkgver}.tar.gz")
sha256sums=('4f0e717a8edc6ede5c4d900d810165ca91f033b2863989daaeaf1b3fe5ea0ad6')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  sed -i s:/lib:/lib32:g Makefile
  make CC="gcc -m32" CFLAGS:='-Wall -Os -fPIC'
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make CC="gcc -m32" CFLAGS:='-Wall -Os -fPIC' DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/bin"
  rm -r "${pkgdir}/usr/include"
}

