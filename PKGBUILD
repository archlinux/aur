# Maintainer: Stefano Facchini <stefano.facchini@gmail.com>
pkgname=pinpoint
pkgver=0.1.4
pkgrel=2
pkgdesc="A tool for making hackers do excellent presentations"
arch=('i686' 'x86_64')
url="https://live.gnome.org/Pinpoint"
license=('LGPL2.1')
depends=('clutter-gst' 'gdk-pixbuf2' 'pango' 'librsvg')
makedepends=()
install=pinpoint.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('4559155e9dc61ee47256ef7f5b73e4cdecbfc1b2bd6b0a1ab45dfee64ae8b92b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -m755 -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 bg.jpg bowls.jpg linus.jpg "$pkgdir/usr/share/doc/$pkgname"
  install -m755 introduction.pin "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
