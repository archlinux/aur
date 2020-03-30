# Contributor: William J. Bowman <aur@williamjbowman.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ect
_pkgname=Efficient-Compression-Tool
pkgver=0.8.3
pkgrel=1
pkgdesc='file compressor, supports postcompression of PNG, JPEG, GZIP and ZIP files.'
url='https://github.com/fhanau/Efficient-Compression-Tool'
arch=('i686' 'x86_64')
license=('Apache')
source=("git+https://github.com/fhanau/Efficient-Compression-Tool.git#commit=f0b38f7f8b750099f14d4976beff6a107d6119ac")
md5sums=('SKIP')
depends=('gcc-libs')
makedepends=('nasm' 'git')

prepare() {
  cd ${_pkgname}
  git submodule init 
  git submodule update --init --recursive --recommend-shallow
}

build() {
  cd ${_pkgname}
  [ -d build ] || mkdir build
  cd build
  cmake -DECT_FOLDER_SUPPORT=off ../src
  make
}

package() {
  cd ${_pkgname}/src

  PREFIX=/usr/ DESTDIR="${pkgdir}" make install
  cd "${pkgdir}"/usr/bin

  # Some things expect this to be an all-caps name
  ln -s ect ECT
}
