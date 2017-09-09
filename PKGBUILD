# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Maintainer: Cody Schafer <aur@codyps.com>

pkgname=libsigrok4dsl
pkgver=0.98
pkgrel=1
pkgdesc="Client software that supports the DSLogic DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('libzip' 'libusb' 'libserialport' 'glib2')
makedepends=('boost')
conflicts=('libsigrok4dslogic')
replaces=('libsigrok4dslogic')
source=("git+https://github.com/DreamSourceLab/DSView.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/DSView/libsigrok4DSL"

  ./autogen.sh

  # remove rpath
  sed 's|^CFLAGS="$CFLAGS -Wall -Wextra -fvisibility=hidden -ludev -Wl,--rpath=/usr/local/lib"|CFLAGS="$CFLAGS -Wall -Wextra -fvisibility=hidden -ludev"|' -i configure.ac
  autoconf
}

build() {
  cd "$srcdir/DSView/libsigrok4DSL"

  ./configure --prefix=/usr --exec-prefix=/usr
  make
}

package() {
  cd "$srcdir/DSView/libsigrok4DSL"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
