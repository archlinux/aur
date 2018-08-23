# Maintainer: Luís Ferreira <contact@lsferreira.net>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=aurorafw-git
_gitname=core
pkgver=0.0.1.alpha.2.r27.914cf66
pkgrel=1
pkgdesc="A Powerful General Purpose Framework"
arch=('x86_64' 'i686')
url="https://gitlab.com/aurorafossorg/p/framework/core"
license=('LGPL3')
provides=('aurorafw')
conflicts=('aurorafw')
depends=('glfw' 'opengl-driver' 'libx11' 'freeimage' 'portaudio' 'libsndfile' 'glew' 'gtk3' 'vulkan-icd-loader' 'vulkan-headers')
makedepends=('git' 'doxygen' 'meson' 'ldc')
source=("$pkgname-$_gitname::git+https://gitlab.com/aurorafossorg/p/framework/core.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname-$_gitname

  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

build() {
  mkdir -p $pkgname-$_gitname/build
  cd $pkgname-$_gitname/build

  env DC=ldmd arch-meson ..

  ninja
}

check() {
  cd $pkgname-$_gitname/build

  meson test
}

package() {
  cd $pkgname-$_gitname/build

  DESTDIR="$pkgdir" ninja install
}

