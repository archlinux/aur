#Maintainer: Marco Martinelli <marco+t2sz@13byte.com>

pkgname=t2sz
pkgver=1.1.2
pkgrel=1
pkgdesc="It compress a file into a seekable zstd. If the file is a tar archive it compress each file in the archive into an independent frame, hence the name: tar 2 seekable zstd."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/martinellimarco/t2sz"
license=('GPL3')
depends=('zstd')
makedepends=('git' 'cmake')
source=(git+https://github.com/martinellimarco/t2sz#tag=v${pkgver})
provides=('t2sz')
noextract=()
sha256sums=('SKIP')

build(){
  cd "$srcdir/$pkgname"
  [[ -d build ]] && rm -r build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE="Release" ..
  make
}

package(){
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
}
