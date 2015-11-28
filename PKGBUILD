# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ffms2-git
pkgver=2.22.0.g129952a
pkgrel=1
pkgdesc="An FFmpeg/Libav based source library and Avisynth/Vapoursynth plugin for easy frame accurate access. (GIT version)"
url='https://github.com/FFMS/ffms2'
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs'
         'libavformat.so'
         'libavcodec.so'
         'libswscale.so'
         'libavutil.so'
         'libavresample.so'
         )
makedepends=('git')
provides=('libffms2.so'
          'ffms2'
          'vapoursynth-plugin-ffms2'
          )
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
    --enable-static=no
  make
}

package() {
  cd ffms2
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/lib/vapoursynth"
  ln -s /usr/lib/libffms2.so "${pkgdir}/usr/lib/vapoursynth/"
}
