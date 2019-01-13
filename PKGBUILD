# Maintainer : Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=sofia-sip
pkgname=sofia-sip-bc
pkgver=1.13.25bc
pkgrel=1
pkgdesc="An open-source SIP User-Agent library"
arch=('x86_64')
url="http://sofia-sip.sourceforge.net"
options=('zipman')
license=('LGPL')
depends=('glib2' 'openssl')
provides=('sofia-sip')
conflicts=('sofia-sip')
source=("https://github.com/BelledonneCommunications/sofia-sip/archive/$pkgver.tar.gz"
    "279f184bc9972778ce9c1eb1c46ae67d5705f66b.patch")
sha256sums=('0200c3c29b17a8a1418ad02bf8c4b09bc1d66ee2e65952fbef203624a2c27b1a'
            '2a9abf5437fb1b2616aa4f090965229d84b62a14084d3cecdc6b9906e1adfee9')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 < "../279f184bc9972778ce9c1eb1c46ae67d5705f66b.patch"
}

build() {
  cd "$_pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --with-openssl
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
