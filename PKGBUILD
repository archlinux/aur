# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Maintainer: Cody Schafer <aur@codyps.com>

pkgname=libsigrok4dsl
pkgver=0.99
pkgrel=1
pkgdesc="Client software that supports the DSLogic DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('libzip' 'libusb' 'libserialport' 'glib2')
makedepends=('boost')
conflicts=('libsigrok4dslogic')
replaces=('libsigrok4dslogic')
source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/${pkgver}.tar.gz"
)
md5sums=('2d8f4e4a7789da60e70b2bd5086963fe')
sha384sums=('9f92432c1721d5e39b343029955c95203bf9cf051095956175e7315e0471bbc01c8ba85708ed3eb085a7cf75932adb6c')

prepare() {
  cd "$srcdir/DSView-$pkgver/libsigrok4DSL"

  ./autogen.sh

  # remove rpath
  sed 's|^CFLAGS="$CFLAGS -Wall -Wextra -fvisibility=hidden -ludev -Wl,--rpath=/usr/local/lib"|CFLAGS="$CFLAGS -Wall -Wextra -fvisibility=hidden -ludev"|' -i configure.ac
  autoconf
}

build() {
  cd "$srcdir/DSView-$pkgver/libsigrok4DSL"

  ./configure --prefix=/usr --exec-prefix=/usr
  make
}

package() {
  cd "$srcdir/DSView-$pkgver/libsigrok4DSL"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
