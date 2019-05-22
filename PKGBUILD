# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=osslsigncode
pkgver="2.0"
pkgrel="1"
pkgdesc="OpenSSL based Authenticode signing for PE/MSI/Java CAB files"
arch=('i686' 'x86_64')
url="https://github.com/mtrojnar/osslsigncode"
license=('GPL')
depends=('curl' 'openssl')
makedepends=('autoconf' 'automake' 'libtool')
options=('!makeflags')
source=("https://github.com/mtrojnar/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('aec7b101afd96925fbd70ac67a6752997f0dab3987151c0658e5f011d8a6be6f53518d7a4aba6dff696c722a1e669100143a87d07c3f59364cd62693e9f3e4e5')

prepare() {
  cd "$srcdir/osslsigncode-${pkgver}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin \
    --bindir=/usr/bin
}

build() {
  cd "$srcdir/osslsigncode-${pkgver}"
  make
}

package() {
  cd "$srcdir/osslsigncode-${pkgver}"
  make DESTDIR="$pkgdir" install
}
