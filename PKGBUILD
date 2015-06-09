# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ffms2-git
pkgver=2.21.11.g08838b2
pkgrel=1
pkgdesc="An FFmpeg/Libav based source library and Avisynth/Vapoursynth plugin for easy frame accurate access. (GIT version)"
url="https://github.com/FFMS/ffms2"
arch=('x86_64' 'i686')
license=('GPL')
depends=('ffmpeg')
makedepends=('git')
provides=('ffms2' 'vapoursynth-plugin-ffms2')
conflicts=('ffms2')
source=('git+https://github.com/FFMS/ffms2.git')
sha1sums=('SKIP')

pkgver() {
  cd ffms2
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd ffms2
  ./configure \
    --prefix=/usr \
    --enable-shared=yes \
    --enable-static=no \
    --enable-avresample
  make
}

package() {
  cd ffms2
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/lib/vapoursynth"
  ln -s ../libffms2.so "${pkgdir}/usr/lib/vapoursynth/"
}
