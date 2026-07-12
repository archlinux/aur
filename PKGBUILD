# Maintainer: hyak <hyakdev@gmail.com>
pkgname=axmol-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="A multi-platform 2D/3D game engine, fork of Cocos2d-x (Stable release package)"
arch=('x86_64')
url="https://github.com/axmolengine/axmol"
license=('MIT')
depends=('glu' 'glew' 'glfw-x11' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'fontconfig' 'sqlite')
makedepends=('git' 'cmake' 'ninja')
provides=('axmol')
conflicts=('axmol' 'axmol-git')
source=("axmol-${pkgver}::git+https://github.com/axmolengine/axmol.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/axmol-${pkgver}"
  git submodule update --init --recursive
}

build() {
  cmake -B build -S axmol-${pkgver} \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 axmol-${pkgver}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
