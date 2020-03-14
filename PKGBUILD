# Maintainer: Jake Jake <aur@ja-ke.tech>
# Maintainer: Cody Schafer <aur@codyps.com>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok4dsl
pkgver=1.10
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
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/v${pkgver}.tar.gz"
)
md5sums=('6a685740c4cc4ecebb58e979dc9127f7')
sha384sums=('6cd82ee9c729db48f86aa00c492eb7e18a8b444d3bd7a384fbd7433e24758d7190ef88082457111b752d28c28145d9a5')

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
