# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=hobbes-git
pkgver=20170710
pkgrel=1
pkgdesc="Language, JIT compiler and DB from Morgan Stanley"
url="https://github.com/Morgan-Stanley/hobbes"
arch=('i686' 'x86_64')
license=('APACHE')
depends=('glibc' 'zlib' 'readline' 'gcc-libs')
makedepends=('git' 'llvm35' 'gtest')
#makedepends=('git' 'llvm39' 'gtest')
conflicts=('hobbes')
provides=('hobbes')
source=('git://github.com/kevinlawler/kona.git')
source=('git://github.com/Morgan-Stanley/hobbes.git')
md5sums=('SKIP')
options=('staticlibs')
_gitname="hobbes"

# requires llvm 3.X
# 4.0 will not work
# I have not tested 3.9

# Appears to static link everything?  Could shave off 36MB, maybe.

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  mkdir -p build
  cd build
  cmake cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
  make PREFIX="/usr"
}

package() {
  cd "$_gitname/build"
  make DESTDIR="$pkgdir" install
}
