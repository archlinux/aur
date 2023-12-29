# Maintainer: Yuriy Davygora <davygora@gmail.com>

_pkgname=audiality2
pkgname=$_pkgname-git
pkgver=1.9.4
pkgrel=2
pkgdesc='Realtime audio and music engine'
arch=(x86_64)
url='http://audiality.org/'
license=(zlib)

makedepends=(
  'base-devel'
  'git'
  'cmake'
)
depends=(
  'sdl'
  'jack'
)

conflicts=(
    "$_pkgname"
)
provides=(
    "$_pkgname"
)

source=("git+https://github.com/olofson/audiality2")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git checkout -b v$pkgver v$pkgver
}

build() {
  rm -rf build; mkdir build; cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr "$srcdir/$_pkgname"
  make
}

package() {
  cd build
  DESTDIR="$pkgdir" make install
}
