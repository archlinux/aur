# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname=avrprog2
pkgver=1.4.1
pkgrel=1
pkgdesc="A Linux tool for the MikroElektronika AVRprog2 programming hardware."
arch=('x86_64' 'i686')
url="http://avrprog2.sourceforge.net/"
license=('GPL')
depends=('boost-libs' 'libusb')
makedepends=('doxygen' 'boost')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Rules dir has moved since systemd-tools.
  sed -i 's|/lib/udev/rules.d|/usr/lib/udev/rules.d|' Makefile.am

  aclocal

  # Fix symlinks to a specific version of automake files...
  rm -f ./build-aux/*
  automake --add-missing

  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('ab4fb55b02c8e0992009a3fda5f4f351')
