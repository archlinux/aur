# Maintainer: lonaowna
# Contributor: Xandaros
pkgname=libcoap
pkgver=4.3.5
pkgrel=2
pkgdesc="C-Implementation of CoAP"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://libcoap.net/"
license=('BSD2' 'GPL2')
makedepends=('git' 'openssl')
provides=('coap-client' 'coap-rd' 'coap-server')
source=("https://github.com/obgm/libcoap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a417ed26ec6c95c041b42353b5b6fad1602e2bf42a6e26c09863450e227b7b5f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix="/usr" --with-openssl --disable-documentation
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
