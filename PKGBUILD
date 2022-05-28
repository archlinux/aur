# Contributor: William J. Bowman <aur@williamjbowman.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ect
_pkgname=Efficient-Compression-Tool
pkgver=0.9.0
pkgrel=1
pkgdesc='file compressor, supports postcompression of PNG, JPEG, GZIP and ZIP files.'
url='https://github.com/fhanau/Efficient-Compression-Tool'
arch=('i686' 'x86_64')
license=('Apache')
source=("git+https://github.com/fhanau/Efficient-Compression-Tool.git#commit=74cd0d283ce52b8c3d049894eaa2e38b2d098473")
md5sums=('SKIP')
depends=('gcc-libs')
makedepends=('nasm' 'git' 'cmake')

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
