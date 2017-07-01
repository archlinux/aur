# Maintainer: Ole André Vadla Ravnås <oleavr@gmail.com>

_name=libusbmuxd
pkgname=libusbmuxd-rr-compatible
pkgver=1.0.9.r51.gc71612c
pkgrel=1
pkgdesc="USB Multiplex Daemon"
url="http://marcansoft.com/blog/iphonelinux/usbmuxd/"
arch=('i686' 'x86_64')
license=('LGPL2.1' 'GPL2')
depends=('libusb' 'libplist')
makedepends=('git')
provides=("$_name")
conflicts=('usbmuxd<1.0.9' "$_name")
source=('git+https://github.com/oleavr/libusbmuxd#branch=eliminate-pthread-cancel')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_name"
  ./autogen.sh
}

build() {
  cd "$srcdir/$_name"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="${pkgdir}" install
}
