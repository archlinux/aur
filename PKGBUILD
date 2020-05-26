# Maintainer: Simon Gardling <titaniumtown@gmail.com>

pkgname=new-ospgl-git
_pkgname=new-ospgl
pkgver=ospm+test+59+g05f879e
pkgrel=1
epoch=1
pkgdesc="Open Space Program"
url="https://www.openspaceprogram.org/"
arch=(x86_64)
license=(GPL2)
makedepends=(cmake make gcc)
provides=(new-ospgl)
source=("git+https://github.com/TheOpenSpaceProgram/new-ospgl.git")
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  git submodule update --init --recursive
}

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgname
  cmake .
  make
  ./ospm fetch https://github.com/TheOpenSpaceProgram/new-ospgl/releases/download/ospm-test/debug_system.zip
  ./ospm fetch https://github.com/TheOpenSpaceProgram/new-ospgl/releases/download/ospm-test/test_parts.zip
}

package() {
  cd $_pkgname
  mkdir -p $pkgdir/opt/new-ospgl/
  cp -rv ospgl $pkgdir/opt/new-ospgl/
  cp -rv res $pkgdir/opt/new-ospgl/
  cp -rv udata $pkgdir/opt/new-ospgl/
  # DESTDIR="$pkgdir"
}
