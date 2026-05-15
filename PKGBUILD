# Maintainer: saber-88
pkgname=wallrift
pkgver=1.2.0
pkgrel=1
pkgdesc="Wayland wallpaper engine with smooth cursor-based parallax effect"
arch=('x86_64')
url="https://github.com/saber-88/wallrift"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libglvnd')
makedepends=('git' 'cmake' 'wayland-protocols')
provides=('wallrift')
conflicts=('wallrift-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saber-88/wallrift/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3f047d4af810b07a528b73a68a21e2fc42f5c011051d2ce4f29620199b18614a')

build() {
  cd "$srcdir/wallrift-$pkgver"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}
package() {
  cd "$srcdir/wallrift-$pkgver"

  install -Dm755 build/wallrift        "$pkgdir/usr/bin/wallrift"
  install -Dm755 build/wallrift-daemon "$pkgdir/usr/bin/wallrift-daemon"

  install -d "$pkgdir/usr/share/wallrift/shaders/"
  install -Dm644 shaders/*.vert shaders/*.frag \
      "$pkgdir/usr/share/wallrift/shaders/"

  install -Dm644 LICENSE \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

