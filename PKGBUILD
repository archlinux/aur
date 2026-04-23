# Maintainer: saber-88
pkgname=wallrift
pkgver=1.1.0
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
sha256sums=('66fdb26e902f24f7846be37dc21fd1b349e0efcfb61cd850a7972e87546fb35c')

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

