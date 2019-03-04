# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=wxedid
pkgver=0.0.17
pkgrel=1
pkgdesc="wxWidgets-based EDID (Extended Display Identification Data) editor"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/wxedid/"
license=('GPL3')
depends=('wxgtk2')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        'configure.patch')
md5sums=('eb09f18621954eece112a8266d4f0f74'
         '519658fdadcbe8c0b66c6d47c1c8715f')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/configure.patch"
}

build() {
  cd "$pkgname-$pkgver"
  autoreconf -f -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
