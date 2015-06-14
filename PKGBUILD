# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok4dslogic
pkgver=0.4
pkgrel=5
pkgdesc="Client software that supports the DSLogic DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('libzip' 'libusb' 'libserialport')
makedepends=('boost')
conflicts=('libsigrok4dslogic')
source=("git+https://github.com/DreamSourceLab/DSLogic.git#commit=7c8b0b19d3c049497612a21500340c0e52dc9a92")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/DSLogic/libsigrok4DSLogic"

  ./autogen.sh

  # remove rpath
  sed 's|^CFLAGS="$CFLAGS -Wall -Wextra -fvisibility=hidden -ludev -Wl,--rpath=/usr/local/lib"|CFLAGS="$CFLAGS -Wall -Wextra -fvisibility=hidden -ludev"|' -i configure.ac
  autoconf
}

build() {
  cd "$srcdir/DSLogic/libsigrok4DSLogic"

  ./configure --prefix=/usr --exec-prefix=/usr
  make
}

package() {
  cd "$srcdir/DSLogic/libsigrok4DSLogic"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
