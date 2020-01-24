# Maintainer: b6b <b6bb at pm dot me>

pkgname=x264-tmod-git
pkgver=159.r3041.ce3db240
pkgrel=1
arch=('x86_64')
pkgdesc='Open Source H264/AVC video encoder (tmod git version)'
url='https://github.com/jpsdr/x264/tree/t_mod_New'
license=('GPL')
depends=(
  'libavcodec.so'
  'libavformat.so'
  'libavutil.so'
  'liblsmash.so'
  'libswscale.so'
)
makedepends=(
  'git'
  'nasm'
  'ffmpeg'
  'l-smash-x264-tmod-git'
)
provides=(
  'x264'
  'libx264'
  'libx264-git'
  'libx264.so'
)
conflicts=(
  'x264'
  'x264-git'
  'libx264'
  'libx264-10bit'
  'libx264-all'
)
replaces=(
  'libx264-git'
  'libx264-10bit-git'
  'libx264-all-git'
)
source=('git+https://github.com/jpsdr/x264.git#branch=t_mod_New')
sha256sums=('SKIP')

pkgver() {
  cd x264

  printf "%s.r%s.%s" "$(grep "#define X264_BUILD" x264.h | cut -d " " -f3)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd x264

  ./configure \
    --prefix='/usr' \
    --enable-shared \
    --enable-lto \
    --enable-pic \
    --disable-gpac \
    --disable-avs \
    --disable-audio

  make
}

package() {
  cd x264

  make DESTDIR="$pkgdir" install
  install -Dm755 x264 "$pkgdir/usr/bin/x264"
}
