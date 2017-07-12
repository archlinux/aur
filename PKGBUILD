# Maintainer: Stefano Facchini <stefano.facchini@gmail.com>
pkgname=pinpoint
pkgver=0.1.8
pkgrel=2
pkgdesc="A tool for making hackers do excellent presentations"
arch=('i686' 'x86_64')
url="https://live.gnome.org/Pinpoint"
license=('LGPL2.1')
depends=('clutter-gst' 'clutter-gtk')
install=pinpoint.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('5a207dd1a35681b7268e6aa5ff9b2c5381f4cc63e5f2e5695997ca9d3264e8ca')

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
