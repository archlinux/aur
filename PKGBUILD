# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=nip2
pkgver=8.7.0
pkgrel=1
pkgdesc="A frontend to the vips image library"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/libvips/nip2"
# optional: graphviz
depends=('vips' 'gsl' 'gtk2' 'desktop-file-utils')
source=("https://github.com/libvips/nip2/releases/download/v${pkgver}/nip2-${pkgver}.tar.gz")
sha256sums=('6ce935adfdc643e0ce32c544aea0efce64a102390170d6696c7d074b7473bd21')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  # files in subdirectories are useful but top-level ones not + they conflict with system files
  rm -f "$pkgdir/usr/share/mime/"* || true
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
}
