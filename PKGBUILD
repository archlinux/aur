# Maintainer: Flávio Zavan <flavio dot zavan at gmail dot com>

pkgname=mupen64plus-video-gliden64-git
pkgver=5e56691
pkgrel=1
pkgdesc="A new generation, open-source graphics plugin for N64 emulators"
arch=('i686' 'x86_64')
url="https://github.com/gonetz/GLideN64"
license=('GPL')
depends=('mupen64plus')
makedepends=('cmake' 'boost' 'git')
source=(git+https://github.com/gonetz/GLideN64.git)
provides=('mupenplus-video-gliden64')
conflicts=('mupenplus-video-gliden64')
md5sums=('SKIP')
_gitname=GLideN64

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "$_gitname/src"
  echo "#define PLUGIN_REVISION \"${pkgver}\"" > "Revision.h"
  mkdir build
  cd build
  cmake -DMUPENPLUSAPI=On ..
  make
}

package() {
  cd "$_gitname/src/build"
  install -Dm644 "plugin/release/mupen64plus-video-GLideN64.so" \
    "$pkgdir/usr/lib/mupen64plus/mupen64plus-video-GLideN64.so"
}
