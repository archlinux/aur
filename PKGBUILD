# Maintainer: Vianney le Clément <vleclement AT gmail·com>
_pkgname=bootimgtool
pkgname=$_pkgname-git
pkgver=20150607.g9ccd962
pkgrel=2
pkgdesc="Android boot.img extractor/assembler handling multiple variants"
arch=('i686' 'x86_64')
url="https://github.com/vianney/bootimgtool"
license=('GPL3')
depends=('openssl')
makedepends=('git' 'cmake')
source=("git+https://github.com/vianney/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "$_date.g$_hash"
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "$srcdir/$_pkgname/build"
  DESTDIR="$pkgdir" cmake --build . --target install
}
