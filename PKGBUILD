# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=zimg-git
pkgver=3.0.3.43.g42b0d40
pkgrel=1
pkgdesc="Scaling, colorspace conversion, and dithering library. (GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=171334'
license=('custom:WTFPL')
depends=('gcc-libs'
         'glibc'
         )
makedepends=('git')
provides=('zimg'
          'libzimg.so'
          )
conflicts=('zimg'
           'vapoursynth-plugin-zimg'
           'vapoursynth-plugin-zimg-git'
           )
source=('git+https://github.com/sekrit-twc/zimg.git')
sha256sums=('SKIP')

pkgver() {
  cd zimg
  echo "$(git describe --long --tags | tr - . | sed 's|release.||g')"
}

prepare() {
  mkdir -p build
}

build() {
  cd zimg
  ./autogen.sh

  cd "${srcdir}/build"
  ../zimg/configure \
    --prefix=/usr

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 zimg/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
