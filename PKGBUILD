# Maintaner: Brian Bidulock <bidulock@Openss7.org>
# Contributopr: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=raktpdf
pkgver=20080320
pkgrel=4
pkgdesc="A GTK+ based PDF viewer"
arch=('x86_64' 'i686')
url="ftp://code-monkey.de/pub/raktpdf"
source=("https://github.com/bbidulock/raktpdf/releases/download/2008-03-20/raktpdf-2008-03-20.tar.gz")
md5sums=('6492ae9cea1c2661f1c82b222ee5c4f3')
license=('GPL')
depends=('poppler-glib' 'gtk2')

build() {
  cd "$srcdir"/$pkgname-2008-03-20/src
  cp ../config.h .
  gcc -I. -DHAVE_CONFIG_H -c `pkg-config --cflags poppler-glib gtk+-2.0` \
    -o rakt-window.o rakt-window.c 
  gcc -I. -DHAVE_CONFIG_H -c `pkg-config --cflags poppler-glib gtk+-2.0` \
    -o main.o main.c 
  gcc `pkg-config --libs poppler-glib gtk+-2.0` \
    main.o rakt-window.o -o ${pkgname}
}
package() {
  install -Dm755 "$srcdir"/$pkgname-2008-03-20/src/${pkgname} \
    $pkgdir/usr/bin/${pkgname} 
} 
