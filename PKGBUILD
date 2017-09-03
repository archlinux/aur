# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=vobsub2srt-git
pkgver=1.0pre7.9.gd4c34ca
pkgrel=1
pkgdesc="Convert IDX/SUB subtitles into SRT text subtitles"
arch=('i686' 'x86_64')
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
  echo "$(git describe --tags --dirty --always | tr - . | tr -d 'v')"
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
