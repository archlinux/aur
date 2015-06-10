# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=larswm
pkgver=7.5.3
pkgrel=4
pkgdesc="A tiling window manager based on 9wm"
arch=('i686' 'x86_64')
url="http://porneia.free.fr/larswm/larswm.html"
license=('custom:9wm')
depends=('libxmu')
makedepends=('imake')
backup=(usr/share/X11/larswm/system.larswmrc)
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
	"$pkgname.desktop")
md5sums=('a8048b8a93e381f3eb649194f254fa7d'
         '528a346582657f7cae09fc89d143e634')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -n "/9wm is free/,/nice day/p" README.9wm > LICENSE
  sed -e 's,/etc/X11/larswmrc,/usr/share/X11/larswm/system.larswmrc,' -i dat.h
  sed -e 's,/etc/X11/larswmrc,/usr/share/X11/larswm/system.larswmrc,' -i larswm.man
  xmkmf -a
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install install.man
  install -Dm0644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/xsessions/$pkgname.desktop"
  install -Dm0644 sample.larswmrc "$pkgdir/usr/share/X11/larswm/system.larswmrc"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=2 et:
