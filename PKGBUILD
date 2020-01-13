# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libquicktime-git
pkgver=r971.gfff99cd
pkgrel=1
pkgdesc="Library for reading and writing quicktime files"
arch=('i686' 'x86_64')
url="http://libquicktime.sourceforge.net/"
license=('LGPL')
depends=('glibc' 'alsa-lib' 'faac' 'faad2' 'gtk2' 'lame' 'libjpeg-turbo' 'libxaw'
         'libxv' 'schroedinger'
         'libavcodec.so' 'libswscale.so' 'libvorbisenc.so' 'libvorbisfile.so'
         'libvorbis.so' 'libx264.so')
makedepends=('git' 'doxygen' 'mesa-libgl')
provides=('libquicktime')
conflicts=('libquicktime')
source=("git+https://git.code.sf.net/p/libquicktime/git")
sha256sums=('SKIP')


pkgver() {
  cd "git"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "git"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-gpl \
    --with-ffmpeg \
    --with-x264
  make
}

package() {
  cd "git"

  make DESTDIR="$pkgdir" install
}
