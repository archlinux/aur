pkgname="stm8flash-git"
_pkgname="stm8flash"
pkgver=a
pkgrel=1
pkgdesc="Utility for flashing STM8 MCU family via ST-LINK (V1 and V2)"
arch=('i686' 'x86_64')
url='https://github.com/vdudouyt/stm8flash'
license=('GPL2')
depends=('libusb')
makedepends=('git')
source=('git+https://github.com/vdudouyt/stm8flash.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/usr/" install
}
