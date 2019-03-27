# Maintainer: tildearrow <acc12345acc at gmail dot com>
# yes, I'm aware of the reference to $srcdir issue
pkgname=input-modifier
pkgver=1.3.2
pkgrel=1
pkgdesc="uinput based key bindings and macros tool"
arch=('i686' 'x86_64')
url="https://github.com/tildearrow/input-modifier"
license=('GPL')
depends=('udev')
makedepends=('cmake')
source=("https://github.com/tildearrow/input-modifier/archive/v$pkgver.tar.gz")
sha256sums=('b7ac3755d22018dd78058d601e09ab2d9b9238b3b1671eeb83938b10de78829d')
install=imod.install

build() {
  cd "$pkgname-$pkgver"
  if [ -e build ]
    then rm -rf build
  fi
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  # unneeded. to be fixed for 1.3.2
  # oh, really? did I say 1.3.2? i'm sorry :( I completely forgot about
  # the PKGBUILD
  rm "$pkgdir/usr/lib/udev/rules.d/98-imod-ubuntu14.rules"
}
