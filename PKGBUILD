# Maintainer: Jordyn Carattini (onlinecloud1@gmail.com)

pkgname=busybox-norootreboot
pkgver=1.25.0
pkgrel=1
pkgdesc="Utilities for rescue and embedded systems"
arch=("i686" "x86_64")
url="http://www.busybox.net"
license=('GPL')
provides=("busybox")
conflicts=("busybox" "busybox-static")
makedepends=("make" "gcc" "sed" "ncurses")
install=busybox-norootreboot.install
source=(
  "$url/downloads/busybox-$pkgver.tar.bz2"
  "https://raw.githubusercontent.com/jcjordyn130/aur-misc/master/busybox-norootreboot/halt.patch"
)
md5sums=('b05af9645076f75429a8683f8afcbdb3'
         'b5ab29025a588785ec7888d03e87823c')

prepare() {
  echo $pkgdir
  cd "busybox-$pkgver"
  patch -p1 -R < ../halt.patch
  make clean
  make defconfig
}

build() {
  cd "busybox-$pkgver"
  make
}

package() {
  cd "$srcdir/busybox-$pkgver"
  install -Dm755 busybox $pkgdir/usr/bin/busybox
}
