# Maintainer: Matt Johnson <matt9j@cs.washington.edu>
# Contributor: Dominik Heidler <dominik@heidler.eu>
# Contributor: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

pkgname=libosmocore
pkgver=1.6.0
pkgrel=2
pkgdesc="core libs for osmocom"
arch=('armv7h' 'i686' 'x86_64')
url="http://bb.osmocom.org/trac/wiki/libosmocore"
license=('GPL')
groups=()
provides=()
depends=('pcsclite' 'lksctp-tools' 'talloc' 'gnutls')
optdepends=('libusb: libosmousb support')
makedepends=('autoconf' 'automake' 'make' 'gcc' 'libtool' 'git' 'pkg-config' 'libusb')

source=("git://git.osmocom.org/libosmocore.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  autoreconf -i
  ./configure --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --datadir=/usr/share \
              --libexecdir=/usr/lib --localstatedir=/var --docdir=/usr/share/doc/libosmocore --libdir=/usr/lib/
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}
