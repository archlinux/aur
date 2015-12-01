# Maintainer: Jeremy Ruten <jeremy.ruten@gmail.com>
pkgname=soil2-hg
pkgver=r52.afce5f882d73
pkgrel=1
pkgdesc="A tiny C library used primarily for uploading textures into OpenGL."
arch=('i686' 'x86_64')
url="https://bitbucket.org/SpartanJ/soil2"
license=('Public Domain')
makedepends=('mercurial' 'premake' 'sdl2')
source=("hg+https://bitbucket.org/SpartanJ/soil2")
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/soil2
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd $srcdir/soil2
  premake4 gmake
  cd make/linux
  make config=release
}

package() {
  cd $srcdir/soil2
  install -Dm644 lib/linux/libsoil2.a "$pkgdir/usr/lib/libsoil2.a"
  install -Dm644 src/SOIL2/SOIL2.h "$pkgdir/usr/include/SOIL2.h"
}

