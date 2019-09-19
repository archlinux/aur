# Maintainer: timescam <rex.ky.ng@gmail.com>

pkgname=id3v2lib-memleak-patch
_pkgname="id3v2lib"
pkgver=r50.4eb49a0
pkgrel=2
pkgdesc="Library written in C to read and edit id3 tags from mp3 files. memleak-patch branch"
arch=("any")
url="https://github.com/hlgsdx/id3v2lib/tree/memleak-patch"
license=("BSD")
makedepends=("cmake")
provides=('id3v2lib')
conflicts=('id3v2lib')
source=("$_pkgname::git+https://github.com/hlgsdx/id3v2lib.git#branch=memleak-patch")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$srcdir/$_pkgname"
  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgname/build"
  cmake \
  ../
  make
}

package() {
  cd "$_pkgname"
  install -d "$pkgdir/usr/include"
  cp -r "include/$_pkgname" "$pkgdir/usr/include"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
