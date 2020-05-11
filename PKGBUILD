# Maintainer: Jake Jake <aur@ja-ke.tech>
# Maintainer: Cody Schafer <aur@codyps.com>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok4dsl
pkgver=1.12
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
md5sums=('d493213a28cfa184dab2d671835774c6')
sha384sums=('52b9fc2dbd9853f33140c2c528d1b31187a185f5869dd4e7700da1da872fec0d2d03732e4f194f487a287107c3e9b0e0')

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
