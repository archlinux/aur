# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=aewm
pkgver=1.3.12
pkgrel=6
pkgdesc="Minimal window manager - includes separate utilities"
arch=('x86_64' 'i686')
url="http://www.red-bean.com/decklin/aewm"
backup=(usr/share/aewm/aewmrc usr/share/aewm/clientsrc)
license=('MIT')
depends=('gtk2')
source=(http://www.red-bean.com/decklin/aewm/$pkgname-$pkgver.tar.bz2
        makefile.patch)
md5sums=('1addbb7e802535dc5f109d79bfea02a5'
         '14c64b37451e675de641e4cc9e661945')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i $srcdir/makefile.patch
  make CFGDIR='$(DESTDIR)/usr/share/aewm'
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make LDFLAGS="-lX11" DESTDIR="$pkgdir" CFGDIR='$(DESTDIR)/usr/share/aewm' install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
