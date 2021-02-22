# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=file2key-libpassphrase
pkgver=3
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
sha256sums=(018b8b2b44a5781d15f464b85e8787492af816d79f3e7af2561901cd7644812b)

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
