# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>

pkgname=nip2
pkgver=8.9.1
pkgrel=1
pkgdesc="frontend to the vips image library"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/libvips/nip2"
# optional: graphviz
depends=('libvips' 'lcms2'  'gsl' 'gtk2' 'openjpeg2' 'desktop-file-utils')
source=("https://github.com/libvips/nip2/releases/download/v${pkgver}/nip2-${pkgver}.tar.gz")
sha256sums=('b75e26eb3fb994faa988e8e07436cac2a4965c2cab08bef3968e817a866d76cd')

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
