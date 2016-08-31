# Maintainer: Wesley Chan https://aur.archlinux.org/account/Wesley_Chan/
# Contributor: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>
# Contributor: honzor 

pkgname=lib32-libmodbus-dev
pkgver=3.1.4
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
sha256sums=('c8c862b0e9a7ba699a49bc98f62bdffdfafd53a5716c0e162696b4bf108d3637')

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
