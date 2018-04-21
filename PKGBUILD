# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=biblesync-git
epoch=1
pkgver=1.2.0.0.g588631b
pkgrel=1
pkgdesc="multicast shared co-navigation library for Bible programs"
arch=('i686' 'x86_64')
url=https://github.com/karlkleinpaste/biblesync""
license=('GPL')
depends=('gcc-libs' 'libutil-linux')
makedepends=('git')
provides=('biblesync')
conflicts=('biblesync')
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
