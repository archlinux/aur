# Maintainer: Lars Hagström <lars@foldspace.nu>
pkgname=arduino-keyboardio-boards-git
pkgver=r25.4737038
pkgrel=1
pkgdesc="Arduino libraries for the Keyboard.io Model01"
arch=('any')
url="https://keyboard.io"
license=('Unknown')
depends=('arduino')
source=("$pkgname"::"git+https://github.com/keyboardio/Arduino-Boards.git"
        "adapt_to_arch.patch")
sha1sums=('SKIP'
          'e78c9ccd9e4b552a3987bd16526cfb68549c17af')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init
  patch -Np1 -i "${srcdir}/adapt_to_arch.patch"
}

package() {
  install -d $pkgdir/usr/share/arduino/hardware/keyboardio/avr/
  cd $srcdir
  cp -R  $pkgname/* $pkgdir/usr/share/arduino/hardware/keyboardio/avr/
}
