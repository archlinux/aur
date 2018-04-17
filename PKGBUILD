# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=nip2
pkgver=8.6.0
pkgrel=1
pkgdesc="A frontend to the vips image library"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/jcupitt/nip2"
# optional: graphviz
depends=('vips' 'gsl' 'gtk2' 'desktop-file-utils')
source=("https://github.com/jcupitt/nip2/releases/download/v${pkgver}/nip2-${pkgver}.tar.gz")
sha256sums=('1ed55f0890a626d7a45c513e4788058d99b45008b793072c3f7e80231a7c7186')

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
