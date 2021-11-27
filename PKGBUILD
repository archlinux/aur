# Maintainer: tildearrow <me@tildearrow.org>
pkgname=input-modifier
pkgver=1.3.5
pkgrel=1
pkgdesc="uinput based key bindings and macros tool"
arch=('i686' 'x86_64')
url="https://github.com/tildearrow/input-modifier"
license=('GPL')
depends=('udev')
makedepends=('cmake')
source=("https://github.com/tildearrow/input-modifier/archive/v$pkgver.tar.gz")
sha256sums=('d36f2453be794f2ae8b84178ae7527aa61c439470315f20f473f07f76b21ac83')
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
  rm "$pkgdir/usr/lib/udev/rules.d/98-imod-ubuntu14.rules"
}
