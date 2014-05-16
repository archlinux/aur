# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=bubblemon-dockapp
pkgver=1.46
pkgrel=4
pkgdesc="This is a system monitoring dockapp, visually based on the GNOME 'BubbleMon' applet"
arch=('i686' 'x86_64')
url="http://www.ne.jp/asahi/linux/timecop/"
license=('GPL')
depends=('gtk2')
makedepends=('patch')
source=(http://www.ne.jp/asahi/linux/timecop/software/$pkgname-$pkgver.tar.gz \
	gdk2.patch)
md5sums=('f1f86fe5c725bf3a6f5fef8709992931'
         '33e075f7d86b0dbceb76a00b8d744b05')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .orig -i ../gdk2.patch
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin/"
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  install -c README "$pkgdir/usr/share/doc/$pkgname/README"
}
