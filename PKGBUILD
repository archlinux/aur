# Maintainer: Jake Jake <aur@ja-ke.tech>
# Maintainer: Cody Schafer <aur@codyps.com>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok4dsl
pkgver=1.11
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
md5sums=('a08acc3db85fa7ca242ebeaec17ecb72')
sha384sums=('82304119956e66fa0b37d0aaf31b1dbeeac8f3f4f2b3960dfd67fbbdad55a0681dd83b7bc12ecf3280dae85be18a975a')

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
