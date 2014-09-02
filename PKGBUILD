#!/bin/bash
# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Yannik Stein <yannik.stein [at] gmail.com>
# Contributor: Roberto Calabrese <robertocalabrese75 [at] gmail.com>

pkgname='libgcj'
pkgver=15_4.9.1_12
pkgrel=1
pkgdesc="Dynamically load and interpret java class files. Built from binary \
executables available in Debian repositories."
url=http://gcc.gnu.org/java/
arch=(i686 x86_64)
license=(GPL)
conflicts=(gcc-gcj)
depends=(zlib)

if [[ $CARCH == i686 ]]; then
  _DEBARCH=i386
  sha1sums=('3255c0836bf8a7333112a495fa737d2aca20290a')
else
  _DEBARCH=amd64
  sha1sums=('e2f2ac96e523ba8c4e685d77362767083e62eb6c')
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
