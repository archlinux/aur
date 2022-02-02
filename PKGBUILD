# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Alex Mekkering <amekkering at gmail dot com>

pkgname=libavresample
pkgver=4.4.1
pkgrel=1
pkgdesc="libavresample from the ffmpeg package because it's been excluded due to deprecation"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url=https://ffmpeg.org/
license=(GPL3)
depends=(
  ffmpeg
)
makedepends=(
  git
  nasm
)
provides=(
  libavresample.so
)
source=(git+https://git.ffmpeg.org/ffmpeg.git#tag=n${pkgver})
sha256sums=('SKIP')

build() {
  cd ffmpeg

  ./configure --prefix=/usr --disable-all --disable-static --enable-shared --enable-manpages --enable-avresample

  make
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man

  # Remove items owned by ffmpeg
  rm -r ${pkgdir}/usr/share
  rm -r ${pkgdir}/usr/include/libavutil
  rm  ${pkgdir}/usr/lib/libavutil.so*
  rm  ${pkgdir}/usr/lib/pkgconfig/libavutil.pc
}
