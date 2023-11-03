#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: David Sugar <dyfet@gnutelephony.org>

pkgname=sipwitch
pkgver=1.9.15
pkgrel=1
pkgdesc="a federated SIP server, the GNU SIP Witch"
arch=(x86_64)
url="https://www.gnu.org/software/sipwitch/"
license=(GPL3)
depends=(avahi pkgconfig)
depends+=('ucommon>=7.0.0')
depends+=(libexosip2-3xx)
makedepends=(make gcc)
source=(ftp://ftp.gnu.org/gnu/sipwitch/$pkgname-$pkgver.tar.gz{,.sig})
b2sums=('6c01fffdacf1434bafe32073fcb3bacda5fbb5a185c9ee49b9ed04e260f975715afb0c88c6bb35e655700902ecc701090e662f793be2ef4f02c9eccdf2e0f42a'
        'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CXXFLAGS="-fpermissive" ./configure --prefix=/usr --with-pkg-config --with-initrddir=none --enable-shared --enable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mv -v "$pkgdir/usr/sbin/sipw" "$pkgdir/usr/bin/sipw"
  rm -rfv "$pkgdir/usr/sbin"
}

# vim:set ts=2 sw=2 et:
