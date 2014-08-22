#!/bin/bash
# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Yannik Stein <yannik.stein [at] gmail.com>
# Contributor: Roberto Calabrese <robertocalabrese75 [at] gmail.com>

pkgname='libgcj'
pkgver=15_4.9.1_8
pkgrel=2
pkgdesc="Dynamically load and interpret java class files. Built from binary \
executables available in Debian repositories."
url=http://gcc.gnu.org/java/
arch=(i686 x86_64)
license=(GPL)
conflicts=(gcc-gcj)
depends=(zlib)

if [[ $CARCH == i686 ]]; then
  _DEBARCH=i386
  sha1sums=('e3a54835d8e71f11dd3b4b05f7da15ed1bbf302d')
else
  _DEBARCH=amd64
  sha1sums=('d54106f33c1d01b4b16ecc1e50cee05d041bd2f4')
fi
source=(http://ftp.debian.org/debian/pool/main/g/gcc-4.9/$pkgname${pkgver%_*}-${pkgver##*_}_${_DEBARCH}.deb)

prepare() {
  tar xf data.tar.*
}

package() {
  find -type f -name 'libgcj.so*' \
    -execdir install -Dm755 {} "$pkgdir/usr/lib/{}" \;
}

# vim:set ts=2 sw=2 et:
