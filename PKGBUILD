# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=lasem
pkgver=0.4.1
pkgrel=1
pkgdesc="SVG and Mathml rendering library"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/emmanuel/category/lasem/"
license=('LGPL')
depends=('gtk3')
makedepends=('intltool')
optdepends=('lyx: ttf fonts for MathML')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('20dfdb964eaf88407fb705499b7bc7d944bc7301369e8792263fb0b31b8fbcc3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir/usr/doc"
}
