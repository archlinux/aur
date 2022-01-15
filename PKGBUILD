#Maintainer: Marco Martinelli <marco+t2sz@13byte.com>

pkgname=t2sz-git
pkgver=1.1.1
pkgrel=1
pkgdesc="t2sz compress a file into a seekable zstd. If the file is a tar archive it compress each file in the archive into an independent frame, hence the name: tar 2 seekable zstd."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/martinellimarco/t2sz"
license=('GPL')
depends=('zstd')
makedepends=('git' 'cmake')
source=(git+https://github.com/martinellimarco/t2sz)
provides=('t2sz')
noextract=()
sha256sums=('SKIP')

build(){
  cd "$srcdir/${pkgname%-git}"
  [[ -d build ]] && rm -r build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE="Release" ..
  make
}

package(){
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="$pkgdir/" install
}
