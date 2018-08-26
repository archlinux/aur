# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=biblesync-git
epoch=1
pkgver=2.0.1.1.gb16df42
pkgrel=1
pkgdesc="multicast shared co-navigation library for Bible programs"
arch=('i686' 'x86_64')
url=https://github.com/karlkleinpaste/biblesync""
license=('GPL')
depends=('gcc-libs' 'libutil-linux')
makedepends=('git')
provides=("biblesync=$pkgver")
conflicts=("biblesync")
source=("git+https://github.com/karlkleinpaste/biblesync.git")
md5sums=('SKIP')
_gitname="biblesync"

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | tr - .
}

build() {
  cd ${pkgname%-git}
  [[ -d build ]] || mkdir build
  cd build
  cmake -DBUILD_SHARED_LIBS=TRUE -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=/usr/lib ..
  make
}

package() {
  cd ${pkgname%-git}/build
  make DESTDIR="$pkgdir/" install
}
