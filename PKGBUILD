# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fsarchiver-git
pkgver=0.8.5.r4.g30c9e23
pkgrel=2
pkgdesc="Filesystem archiver for Linux"
arch=('i686' 'x86_64')
url="https://www.fsarchiver.org/"
license=('GPL2')
depends=('glibc' 'bzip2' 'e2fsprogs' 'libgcrypt' 'lz4' 'lzo' 'xz' 'zlib' 'zstd')
makedepends=('git')
provides=('fsarchiver')
conflicts=('fsarchiver')
source=("git+https://github.com/fdupoux/fsarchiver.git")
sha256sums=('SKIP')


pkgver() {
  cd "fsarchiver"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "fsarchiver"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin"
  make
}

package() {
  cd "fsarchiver"

  make DESTDIR="$pkgdir" install
}
