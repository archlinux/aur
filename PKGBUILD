# Maintainer: tildearrow <tildearrow@protonmail.com>
# yes, I'm aware of the reference to $srcdir issue
pkgname=input-modifier
pkgver=1.3.4
pkgrel=1
pkgdesc="uinput based key bindings and macros tool"
arch=('i686' 'x86_64')
url="https://github.com/tildearrow/input-modifier"
license=('GPL')
depends=('udev')
makedepends=('cmake')
source=("https://github.com/tildearrow/input-modifier/archive/v$pkgver.tar.gz")
sha256sums=('25b522d72d3a5a75c42e4c7bf9d63fa547e7912e7266d7306d04a532ae149137')
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
