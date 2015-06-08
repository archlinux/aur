# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=biblesync-git
pkgver=20150102.c275968
pkgrel=1
pkgdesc="multicast shared co-navigation library for Bible programs"
arch=('i686' 'x86_64')
url=https://github.com/karlkleinpaste/biblesync""
license=('GPL')
depends=('gcc-libs' 'libutil-linux')
makedepends=('git')
source=("git+https://github.com/karlkleinpaste/biblesync.git")
md5sums=('SKIP')
_gitname="biblesync"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$srcdir"/"$_gitname"
  [[ -d build ]] || mkdir build
  cd build
  cmake -DBUILD_SHARED_LIBS=TRUE -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=/usr/lib ..
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir/" install
}
