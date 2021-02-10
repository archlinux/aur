# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=osslsigncode
pkgver="2.1"
pkgrel="1"
pkgdesc="OpenSSL based Authenticode signing for PE/MSI/Java CAB files"
arch=('i686' 'x86_64')
url="https://github.com/mtrojnar/osslsigncode"
license=('GPL')
depends=('curl' 'openssl')
makedepends=('autoconf' 'automake' 'libtool')
options=('!makeflags')
source=("https://github.com/mtrojnar/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c9bf6693abac9bc5172a7373e539410208ff1ee2a656ea214e04cff499519f783cfbf1a1fcda3bc6b949787950f7eaba4e97974b56d2c38992a8e043f4f134f5')

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
