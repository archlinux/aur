# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# $Id: PKGBUILD 84937 2010-07-05 17:46:04Z eric $
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=papilio-loader-git
pkgver=20140320
pkgrel=1
pkgdesc="Bitstream loader for Papilio One FPGA board."
arch=("i686" "x86_64")
url="https://github.com/GadgetFactory/Papilio-Loader"
license=("GPL2" "LGPL2.1")
depends=(libftdi-compat)
makedepends=(git gcc)
#makedepends=(git gcc libftd2xx flex bison)
options=('!strip')
source=(git://github.com/GadgetFactory/Papilio-Loader.git)
#source=(git://github.com/ivanovp/Papilio-Loader.git)
md5sums=('SKIP')

build() {
# msg "GIT checkout done or server timeout"
  cd "$srcdir/Papilio-Loader/papilio-prog"
  if [ ! -f ./configure ]; then
    chmod +x ./autogen.sh
    ./autogen.sh
  fi
# ./configure --prefix=/usr CFLAGS="-Wno-error=unused-but-set-variable"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir//Papilio-Loader/papilio-prog"
  make DESTDIR="$pkgdir" install
  install -d $pkgdir/usr/share/$pkgname
  cd "../Fpga"
  install -Dm644 *.bit $pkgdir/usr/share/$pkgname
}
