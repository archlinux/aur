# Maintainer: Wesley Chan https://aur.archlinux.org/account/Wesley_Chan/
# Contributor: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>
# Contributor: honzor 

pkgname=lib32-libmodbus
pkgver=3.0.6
pkgrel=1
pkgdesc="A Modbus library for Linux, Mac OS X, FreeBSD, QNX and Win32."
arch=('x86_64')
url="http://libmodbus.org"
license=('LGPL')
makedepends=(asciidoc xmlto)
conflicts=(lib32-libmodbus-dev)
options=(!libtool staticlibs)
_pkgfqn="libmodbus-${pkgver}"
source=(http://libmodbus.org/releases/libmodbus-$pkgver.tar.gz)
sha256sums=('046d63f10f755e2160dc56ef681e5f5ad3862a57c1955fd82e0ce036b69471b6')

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
