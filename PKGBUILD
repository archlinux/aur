# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=libarchive-git
pkgver=3.7.5.r439.g1b9b4272
pkgrel=1
pkgdesc="Multi-format archive and compression library"
arch=('i686' 'x86_64')
url="https://libarchive.org/"
license=('BSD-2-Clause')
depends=('glibc' 'libb2' 'libacl.so' 'libbz2.so' 'libcrypto.so' 'libexpat.so' 'liblzma.so' 'liblz4.so' 'libz.so' 'libzstd.so')
makedepends=('git' 'acl' 'bzip2' 'expat' 'lz4' 'openssl' 'xz' 'zlib' 'zstd')
provides=("libarchive=$pkgver" 'libarchive.so')
conflicts=('libarchive')
options=('staticlibs')
source=("git+https://github.com/libarchive/libarchive.git")
sha256sums=('SKIP')


pkgver() {
  cd "libarchive"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libarchive"

  build/autogen.sh
  ./configure \
    --prefix="/usr" \
    --without-nettle \
    --without-xml2
  make
}

check() {
  cd "libarchive"

  #make check
}

package() {
  cd "libarchive"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libarchive"
}
