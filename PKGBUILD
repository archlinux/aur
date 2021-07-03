# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=libexosip2
epoch=1
pkgver=5.2.1
pkgrel=1
pkgdesc="A library that hides the complexity of using SIP for multimedia session establishement"
arch=('x86_64' 'i686')
url="https://savannah.nongnu.org/projects/exosip/"
license=('GPL')
depends=("libosip2>=${pkgver}" openssl)
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')
source=(https://download.savannah.gnu.org/releases/exosip/libexosip2-$pkgver.tar.gz)
sha256sums=('87256b45a406f3c038e1e75e31372d526820366527c2af3bb89329bafd87ec42')

build() {
  cd "$srcdir/libexosip2-${pkgver}"
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$srcdir/libexosip2-${pkgver}"
  make DESTDIR="$pkgdir" install
}
