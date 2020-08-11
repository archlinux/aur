# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=glsl-language-server
pkgver=0.3.5
pkgrel=1
pkgdesc="A language server implementation for GLSL"
arch=('x86_64')
url="https://github.com/svenstaro/glsl-language-server"
license=(MIT)
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=(git+git://github.com/svenstaro/glsl-language-server.git#tag=${pkgver})
sha512sums=('SKIP')

prepare() {
  cd "$pkgname"

  git submodule update --init
}

build() {
  cd "$pkgname"

  cmake . \
    -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd "$pkgname"

  make -C build DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

