# Maintainer: Alex Tharp <toastercup@gmail.com>
# Issues: https://github.com/toastercup/aur-packages/issues

pkgname=polyvox-git
pkgver=r2156.c986c9f0
pkgrel=2
pkgdesc="PolyVox is a library for storing, manipulating, and displaying volumetric representations of objects"
arch=('i686' 'x86_64')
url="http://www.volumesoffun.com/polyvox-about/"
license=('zlib')
makedepends=('git' 'cmake')
provides=(polyvox)
conflicts=(polyvox)
source=("$pkgname::git+https://bitbucket.org/volumesoffun/polyvox.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir && mkdir -p build && cd $_
  cmake -DENABLE_EXAMPLES=OFF -DENABLE_TESTS=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:STRING=Release "../$pkgname"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/"
}

