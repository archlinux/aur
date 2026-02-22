# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=file2key-libpassphrase
pkgver=3.1.2
pkgrel=2
pkgdesc="A simple command that generates a key from a file and a passphrase, libpassphrase version"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/file2key"
license=('custom:ISC')
conflicts=(file2key)
provides=(file2key)
depends=(libkeccak libpassphrase)
makedepends=(libkeccak libpassphrase)
source=(file2key-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(e9b79bdbdbf92be34b031b90708130aa80af14df64261a0eab2b880810b55944)

prepare() {
  cd "${srcdir}/file2key"
  sed '/CPPFLAGS/s/$/ -DWITH_LIBPASSPHRASE/' < config.mk > config.mk.tmp
  sed '/LDFLAGS/s/$/ -lpassphrase/' < config.mk.tmp > config.mk
}

build() {
  cd "$srcdir/file2key"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/file2key"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
