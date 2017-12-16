# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=zimg-git
pkgver=2.6.3.64.gf578889
pkgrel=1
pkgdesc="Scaling, colorspace conversion, and dithering library. (GIT version)"
arch=('i686' 'x86_64')
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
  cd zimg
  ./autogen.sh
}

build() {
  cd zimg
  ./configure \
    --prefix=/usr

  make
}

package(){
  make -C zimg DESTDIR="${pkgdir}" install

  install -Dm644 zimg/COPYING "${pkgdir}/usr/share/licenses/zimg-git/COPYING"
}
