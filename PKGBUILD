# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=libexosip2
epoch=1
pkgver=5.3.0
pkgrel=1
pkgdesc="A library that hides the complexity of using SIP for multimedia session establishement"
arch=('x86_64' 'i686')
url="https://savannah.nongnu.org/projects/exosip/"
license=('GPL')
depends=("libosip2>=${pkgver}" openssl)
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')
source=(https://download.savannah.gnu.org/releases/exosip/libexosip2-$pkgver.tar.gz)
sha256sums=('5b7823986431ea5cedc9f095d6964ace966f093b2ae7d0b08404788bfcebc9c2')

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
