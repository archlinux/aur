# Maintainer: Roland Suchan <snrd at arcor dot de>

#%define soname  152
#%define tar_version snapshot-20180305-2245-stable

#pkgname=x264
pkgname=x264_152
#pkgver=0.159.r2991.1771b55
#pkgver="${soname}"
pkgver=152
pkgrel=2
#epoch=3
pkgdesc='Open Source H264/AVC video encoder'
arch=(x86_64)
url=https://www.videolan.org/developers/x264.html
license=(GPL)
depends=(
  ffmpeg21
  bzip2
  #liblsmash.so
)
makedepends=(
  git
  l-smash
  nasm
)
provides=(
  #libx264.so
  libx264.so.152
)
#conflicts=(
#  libx264
#  libx264-10bit
#  libx264-all
#)
#replaces=(
#  libx264
#  libx264-10bit
#  libx264-all
#)

#source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2")
#source=("x264-${tar_version}.tar.bz2")
source=("https://sourceforge.net/projects/qdvd/files/x264_152/x264-snapshot-20180305-2245-stable.tar.bz2")
md5sums=('6ec3a24ac4fc311cfda302f534dc2c92')
#source=(git+https://code.videolan.org/videolan/x264.git#commit=1771b556ee45207f8711744ccbd5d42a3949b14c)
#sha256sums=(SKIP)

#if [ "$arch" == "x86_64" ]; then
#  alias _libdir="/usr/lib64"
#else
#  alias _libdir="/usr/lib"
#fi

#  alias _includedir="/usr/include"

#pkgver() {
  #cd x264
#  cd x264-snapshot-20180305-2245-stable

#  ./version.sh | grep X264_POINTVER | sed -r 's/^#define X264_POINTVER "([0-9]+\.[0-9]+)\.([0-9]+) (.*)"$/\1.r\2.\3/'
#}

build() {
  #cd x264
  cd x264-snapshot-20180305-2245-stable

  ./configure \
    --prefix=/opt \
    --enable-shared \
    --extra-ldflags=-L/opt/ffmpeg21/lib \
    --extra-cflags=-I/opt/ffmpeg21/include
    #--libdir="${_libdir}" \
    #--includedir="${_includedir}"
  #make "-j$(nproc)" || return 1
  make
}

package() {
  #make -C x264 DESTDIR="${pkgdir}" install-cli install-lib-shared
  make -C x264-snapshot-20180305-2245-stable DESTDIR="$pkgdir" install-cli install-lib-shared
  #make DESTDIR="$pkgdir" install
  #make -C x264-snapshot-20180305-2245-stable DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
