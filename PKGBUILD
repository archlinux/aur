# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=file2key-libpassphrase
pkgver=3.1
pkgrel=1
pkgdesc="A simple command that generates a key from a file and a passphrase, libpassphrase version"
arch=(i686 x86_64)
url="https://github.com/maandree/file2key"
license=('custom:ISC')
conflicts=(file2key)
provides=(file2key)
depends=(glibc libkeccak libpassphrase)
makedepends=(make coreutils gcc glibc libkeccak libpassphrase)
source=(file2key-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(ad44f72710232ac88c72a41bb21ea3341f7f5981c7d954f3f3d3c68f23857c8c)

prepare() {
  cd "${srcdir}/file2key-${pkgver}"
  sed '/CPPFLAGS/s/$/ -DWITH_LIBPASSPHRASE/' < config.mk > config.mk.tmp
  sed '/LDFLAGS/s/$/ -lpassphrase/' < config.mk.tmp > config.mk
}

build() {
  cd "$srcdir/file2key-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/file2key-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}
