# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ffms2000-git
pkgver=2.22.172.g68895b7
pkgrel=1
pkgdesc="The experimental future of FFMS2. (GIT version)"
url='https://forum.doom9.org/showthread.php?t=174469'
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
source=('git+https://github.com/FFMS/ffms2.git#branch=ffms2000')
sha256sums=('SKIP')

pkgver() {
  cd ffms2
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd ffms2
  ./autogen.sh \
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
