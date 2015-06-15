#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=db4.5
_rname=db
pkgver=4.5.20
pkgrel=2
pkgdesc="The Berkeley DB embedded database system 4.5"
arch=('any')
license=('custom:db4.5')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
options=('!libtool' '!makeflags')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz)
sha512sums=('c34907a53323158627971f464c32b9a5b00aff0fa779c67117826ebeea86a4731e272a5dc6dc5ae32f16284ff15c79d93050273795381acaaefd48e18dc2d612')

build() {
  cd "${srcdir}"/$_rname-${pkgver}/build_unix
  ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --enable-static --enable-cxx --enable-dbm
  make
}

package() {
  cd "${srcdir}"/$_rname-${pkgver}/build_unix
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et: