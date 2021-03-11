# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Jeremy Ruten <jeremy.ruten@gmail.com>

pkgname=soil2-git
pkgver=1.20.r14.g8d14c71
pkgrel=1
pkgdesc="A tiny C library used primarily for uploading textures into OpenGL."
arch=('x86_64')
url="https://github.com/SpartanJ/SOIL2"
license=('Public Domain')
provides=('soil2')
conflicts=('soil2')
makedepends=('git' 'premake' 'sdl2')
source=("git+https://github.com/SpartanJ/SOIL2.git")
sha512sums=('SKIP')

pkgver() {
  cd SOIL2
  git describe --long | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd SOIL2
  premake5 gmake
  cd make/linux
  make config=release_x86_64
}

package() {
  cd SOIL2
  install -Dm644 lib/linux/libsoil2.a "$pkgdir/usr/lib/libsoil2.a"
  install -Dm644 src/SOIL2/SOIL2.h "$pkgdir/usr/include/SOIL2.h"
}

