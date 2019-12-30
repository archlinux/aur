# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=libarchive-git
pkgver=3.4.1.r1.gded60625
pkgrel=2
pkgdesc="Multi-format archive and compression library"
arch=('i686' 'x86_64')
url="https://libarchive.org/"
license=('BSD' 'custom')
depends=('glibc' 'acl' 'attr' 'bzip2' 'expat' 'lz4' 'openssl' 'xz' 'zlib' 'zstd')
makedepends=('git')
provides=('libarchive')
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

  make check
}

package() {
  cd "libarchive"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libarchive"
}
