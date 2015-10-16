# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
pkgname=libarcus-git
pkgver=r117.2ad9f67
pkgrel=1
pkgdesc="A library designed to facilitate the communication between Cura and its backend and similar code."
arch=('i686' 'x86_64')
url="https://github.com/Ultimaker/libArcus"
license=('GPL2')
provides=('libarcus')
conflicts=('libarcus')
depends=('protobuf3')
makedepends=('git' 'cmake')
source=('git+https://github.com/Ultimaker/libArcus.git'
		'site-packages-dir.patch')
md5sums=('SKIP' 'b8946cb96b180f82bdd8804b292ec5dd')

pkgver() {
  cd libArcus
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd libArcus
  patch -Np1 -i ../site-packages-dir.patch
}

build() {
  mkdir -p libArcus/build
  cd libArcus/build
  cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/libArcus/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
