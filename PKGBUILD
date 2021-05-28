#Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=libmxp
pkgver=0.2.5
pkgrel=1
pkgdesc="Mud eXtension Protocol library"
arch=('i686' 'x86_64')
url="https://invent.kde.org/games/kmuddy.git"
_gitname="kmuddy/libmxp"
license=('GPL')
makedepends=('cmake' 'git')
provides=('libmxp')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname
  head ChangeLog| grep '\*\*\*' | head -n 1 | awk '{ print $6 }'
}

build() {
  
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build
  cmake .. \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
    
  make
}

package() {
  cd "$srcdir"/$_gitname/build
  make DESTDIR="$pkgdir/" install
}

