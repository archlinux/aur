# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=glsl-language-server
pkgver=0.3.2
pkgrel=1
pkgdesc="A language server implementation for GLSL"
arch=('x86_64')
url="https://github.com/svenstaro/glsl-language-server"
license=(MIT)
makedepends=(cmake git)
source=(git+git://github.com/svenstaro/glsl-language-server.git#tag=${pkgver})
sha512sums=('SKIP')

prepare() {
  cd "$pkgname"

  git submodule update --init
}

build() {
  cd "$pkgname"

  [[ -d build ]] && rm -rf build
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname"/build

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

