# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=vobsub2srt-git
pkgver=1.0.7.gf3205f5
pkgrel=1
pkgdesc="Convert IDX/SUB subtitles into SRT text subtitles. (GIT version)"
arch=('x86_64')
url='https://github.com/ruediger/VobSub2SRT'
license=('GPL')
depends=('tesseract')
optdepends=('tesseract-data: Tesseract OCR data')
makedepends=('cmake'
             'git'
             )
source=('vobsub2srt::git+https://github.com/ecdye/VobSub2SRT.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd vobsub2srt
  echo "$(git describe --long --tags | tr - . |tr -d v)"
}

prepare() {
  sed '40a#include <climits>' -i vobsub2srt/src/vobsub2srt.c++
}

build() {
  cmake -S vobsub2srt -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBASH_COMPLETION_PATH=/usr/share/bash-completion/completions

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}
