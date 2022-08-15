# Contributor: William J. Bowman <aur@williamjbowman.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ect
_pkgname=Efficient-Compression-Tool
pkgver=0.9.2
pkgrel=1
pkgdesc='file compressor, supports postcompression of PNG, JPEG, GZIP and ZIP files.'
url='https://github.com/fhanau/Efficient-Compression-Tool'
arch=('i686' 'x86_64')
license=('Apache')
source=("git+$url.git#commit=48aea4e39396a0f6e39fbc504a4b194282c9ff01")
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
  cd ${_pkgname}/build
  install -Dm755 ect "$pkgdir"/usr/bin/ect 
  cd "${pkgdir}"/usr/bin

  # Some things expect this to be an all-caps name
  ln -s ect ECT
}
