# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Yamashita Ren
# Contributor: Fredrick Brennan <admin@8chan.co>
# Contributor: Julien Machiels

pkgname=waifu2x-converter-cpp-cuda-git
pkgver=r383.fa270a5
pkgrel=1
pkgdesc="Image Super-Resolution for Anime-Style-Art. (re-implementation in C++ using OpenCV). with CUDA support (GIT Version)"
arch=('i686' 'x86_64')
url='https://github.com/tanakamura/waifu2x-converter-cpp'
license=('GPL')
depends=('opencv'
         'cuda'
         )
makedepends=('cmake'
             'git'
             )
provides=('waifu2x-converter-cpp' 'waifu2x')
conflicts=('waifu2x-converter-cpp' 'waifu2x')
source=('git+https://github.com/tanakamura/waifu2x-converter-cpp.git')
sha1sums=('SKIP')

pkgver() {
  cd waifu2x-converter-cpp
  #echo $(git describe --long --tags | tr - .)
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../waifu2x-converter-cpp \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCUDA_SDK_ROOT_DIR=/opt/cuda \
    -DINSTALL_MODELS=on
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
}
