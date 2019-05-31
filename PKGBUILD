# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libvorbis-git
pkgver=1.3.6.r18.g9eadecc
pkgrel=1
pkgdesc="Reference implementation of the Ogg Vorbis audio format"
arch=('i686' 'x86_64')
url="https://xiph.org/vorbis/"
license=('BSD')
depends=('libogg')
makedepends=('git')
provides=('libvorbis' 'libvorbisfile.so' 'libvorbis.so' 'libvorbisenc.so')
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
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "vorbis"

  make check
}

package() {
  cd "vorbis"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libvorbis"
}
