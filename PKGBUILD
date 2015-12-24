# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=biosdevname
pkgver=0.7.1
pkgrel=1
pkgdesc="Udev helper for naming devices per BIOS names"
arch=(i686 x86_64)
url="http://linux.dell.com/cgi-bin/cgit.cgi/biosdevname.git"
license=('GPL')
depends=(pciutils)
makedepends=(zlib)
source=(http://linux.dell.com/cgi-bin/cgit.cgi/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e814c7b21f5974b248e469402bdb999d')

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
