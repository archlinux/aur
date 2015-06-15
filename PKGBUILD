#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=db5.2
_rname=db
pkgver=5.2.42
pkgrel=2
pkgdesc="The Berkeley DB embedded database system 4.5"
arch=('any')
license=('custom:db4.5')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
options=('!libtool' '!makeflags')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz)
sha512sums=('8f9e6e38d9aa0a5fb3f9733cd60b37f012ba43a6f0e632af09f1bd3afa552c3d68b1e2a44393eace2bf8692eba855611affc45401e1bee36bab541fd0869c811')

build() {
  cd "${srcdir}"/$_rname-${pkgver}/build_unix
  ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --enable-static --enable-cxx --enable-dbm
  make LIBSO_LIBS=-lpthread
}

package() {
  cd "${srcdir}"/$_rname-${pkgver}/build_unix
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/docs
}

# vim:set ts=2 sw=2 et: