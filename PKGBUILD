# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libvorbis-git
pkgver=1.3.7.r10.g84c02369
pkgrel=2
pkgdesc="Reference implementation of the Ogg Vorbis audio format"
arch=('i686' 'x86_64')
url="https://xiph.org/vorbis/"
license=('BSD-3-Clause')
depends=('libogg')
makedepends=('git')
provides=("libvorbis=$pkgver" 'libvorbisfile.so' 'libvorbis.so' 'libvorbisenc.so')
conflicts=('libvorbis')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/vorbis.git")
sha256sums=('SKIP')


pkgver() {
  cd "vorbis"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "vorbis"

  ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "vorbis"

  #make check
}

package() {
  cd "vorbis"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libvorbis"
}
