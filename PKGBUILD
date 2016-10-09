# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=biosdevname
pkgver=0.7.2
pkgrel=2
pkgdesc="Udev helper for naming devices per BIOS names"
arch=(i686 x86_64)
url="https://github.com/dell/biosdevname"
license=('GPL')
depends=(pciutils)
makedepends=(zlib)
source=("https://github.com/dell/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('57e43be362715c12d4ce9743ee06363b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --disable-rpath --prefix=/usr \
    --bindir=/usr/bin --sbindir=/usr/bin \
    --libdir=/usr/bin --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/lib $pkgdir/usr
  sed -i $pkgdir/usr/lib/udev/rules.d/71-biosdevname.rules \
    -e 's!/sbin/!/bin/!'
}

# vim:set ts=2 sw=2 et:
