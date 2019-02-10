# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=vobsub2srt-git
pkgver=v1.0pre7.11.g0ba6e25
pkgrel=1
pkgdesc="Convert IDX/SUB subtitles into SRT text subtitles"
arch=('x86_64')
url='https://github.com/ruediger/VobSub2SRT'
license=('GPL')
depends=('tesseract')
optdepends=('tesseract-data: Tesseract OCR data')
makedepends=('cmake'
             'git'
             )
source=('vobsub2srt::git://github.com/ruediger/VobSub2SRT.git')
sha256sums=('SKIP')

pkgver() {
  cd vobsub2srt
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  sed 's|-Wno-long-long|& -std=gnu++11|g' -i vobsub2srt/CMakeLists.txt
}

build() {
  cd build
  cmake ../vobsub2srt \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBASH_COMPLETION_PATH=/usr/share/bash-completion/completions

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
