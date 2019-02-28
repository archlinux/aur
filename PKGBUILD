# Maintainer: Shawn Rutledge <s@ecloud.org>

_gitname=md4c
pkgname=md4c-git
pkgver=release.0.3.0.rc.r6.gcbae179
pkgrel=1
pkgdesc="Markdown parser library in C, and md2html converter"
arch=('i686' 'x86_64')
url='https://github.com/mity/md4c'
license=('MIT')
makedepends=('git' 'cmake')
conflicts=('md4c')
source=("git+https://github.com/mity/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
