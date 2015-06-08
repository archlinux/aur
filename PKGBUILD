# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
pkgname=libarcus-git
pkgver=r84.3d6e94d
pkgrel=1
pkgdesc="A library designed to facilitate the communication between Cura and its backend and similar code."
arch=('i686' 'x86_64')
url="https://github.com/Ultimaker/libArcus"
license=('GPL2')
provides=('libarcus')
conflicts=('libarcus')
depends=('protobuf3')
makedepends=('git' 'cmake')
source=('git+https://github.com/Ultimaker/libArcus.git')
md5sums=('SKIP')

pkgver() {
  cd libArcus
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p libArcus/build
  cd libArcus/build
  cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=OFF ..
  make
}

package() {
  cd "$srcdir/libArcus/build"
  make DESTDIR="$pkgdir/" install

  mv "$pkgdir/usr/local/lib64/" "$pkgdir/usr/lib/"
}

# vim:set ts=2 sw=2 et:
