# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=nip2
pkgver=8.4.0
pkgrel=1
pkgdesc="A frontend to the vips image library"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.vips.ecs.soton.ac.uk/"
# optional: graphviz
depends=('vips' 'gsl' 'gtk2' 'desktop-file-utils')
source=("http://www.vips.ecs.soton.ac.uk/supported/${pkgver%.*}/$pkgname-$pkgver.tar.gz")
md5sums=('8ae0254e9be3aec2ac48f60911227ecd')

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
