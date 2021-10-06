# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=avs2yuv-git
pkgver=0.30.6.g631e97c
pkgrel=1
pkgdesc="A simple tool that can execute avisynth scripts. (GIT version)"
arch=('x86_64')
url='https://github.com/DJATOM/avs2yuv'
license=('GPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=('avs2yuv')
conflicts=('av2yuv')
source=('git+https://github.com/DJATOM/avs2yuv.git')
sha256sums=('SKIP')

pkgver() {
  cd avs2yuv
#   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../avs2yuv \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=usr

  make
}

package(){
  install -Dm755 build/avs2yuv "${pkgdir}/usr/bin/avs2yuv"
}
