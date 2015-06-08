# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=vobsub2srt-git
pkgver=v1.0pre6.62.g9283345
pkgrel=1
pkgdesc="Convert IDX/SUB subtitles into SRT text subtitles"
arch=('i686' 'x86_64')
url="https://github.com/ruediger/VobSub2SRT/blob/master/README.org"
license=('GPL')
depends=('tesseract')
optdepends=('tesseract-data: Tesseract OCR data')
makedepends=('cmake' 'git')
source=('vobsub2srt::git://github.com/ruediger/VobSub2SRT.git')
md5sums=('SKIP')

pkgver() {
  cd vobsub2srt
  echo "$(git describe --always | tr - .)"
}

prepare() {
  mkdir -p build
}

build(){
  cd build
  cmake ../vobsub2srt \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBASH_COMPLETION_PATH=/usr/share/bash-completion/completions
  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install
}
