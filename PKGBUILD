# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>

pkgname=flphoto
pkgver=1.3.1
pkgrel=4
pkgdesc="Basic image management and display program based on the FLTK toolkit"
arch=('i686' 'x86_64')
url="http://www.easysw.com/~mike/flphoto/"
license=('GPL')
depends=('fltk' 'libgphoto2' 'libcups')
install="flphoto.install"
source=("http://downloads.sourceforge.net/sourceforge/fltk/$pkgname-$pkgver-source.tar.gz" 
        "fixes.patch"
	"flphoto.desktop")
md5sums=('5e02353cadfc07250731f34f24e83866'
         '9664ac1af80f9871a9c17bb72dd019b4'
         'c8a81fe1ba9708d85c29972ad28057fd')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .orig -i ../fixes.patch
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make espmsg
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 "doc/flphoto.png" "$pkgdir/usr/share/pixmaps/flphoto.png"
  install -Dm0644 "$srcdir/flphoto.desktop" "$pkgdir/usr/share/applications/flphoto.desktop"
}
