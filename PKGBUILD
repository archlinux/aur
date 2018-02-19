# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=libexosip2
epoch=1
pkgver=5.0.0
pkgrel=2
pkgdesc="A library that hides the complexity of using SIP for multimedia session establishement"
arch=('x86_64' 'i686')
url="https://savannah.nongnu.org/projects/exosip/"
license=('GPL')
depends=('libosip2>=4.0.0' 'openssl')
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')
source=(https://download.savannah.gnu.org/releases/exosip/libexosip2-$pkgver.tar.gz
        openssl110.patch)
sha256sums=('a26558594de95405d3adeee554a7c10cb3ec5a9316a879e679b53a99a9cf2e1f'
            'e60ef8fe99e7aa8641398a70708ab1e4f85d04872f1c658949afc4fd657c4d5a')

prepare() {
  cd "$srcdir/libexosip2-${pkgver}"
  patch -Np1 -i ../openssl110.patch
}

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
