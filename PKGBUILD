# Maintainer: Wesley Chan https://aur.archlinux.org/account/Wesley_Chan/
# Contributor: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>
# Contributor: honzor 

pkgname=lib32-libmodbus-dev
pkgver=3.1.2
pkgrel=1
pkgdesc="A Modbus library for Linux, Mac OS X, FreeBSD, QNX and Win32 (development version)"
arch=('x86_64')
url="http://libmodbus.org"
license=('LGPL')
makedepends=(asciidoc xmlto)
provides=(lib32-libmodbus)
conflicts=(lib32-libmodbus)
options=(!libtool staticlibs)
_pkgfqn="libmodbus-${pkgver}"
source=(http://libmodbus.org/releases/libmodbus-$pkgver.tar.gz)
sha256sums=('661e14f9dc904f3f1b034464ddaa5fd4b8472f8f5d1ea10a1148af85591b7ee9')

build() {
  cd "$srcdir/$_pkgfqn"
  autoreconf --install --symlink --force
  export CC="gcc -m32"
  ./configure --prefix=/usr --libdir=/usr/lib32 --enable-static --without-documentation
  make
}

package() {
  cd "$srcdir/$_pkgfqn"
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/share"
}
