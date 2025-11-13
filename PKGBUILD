# Maintainer: nikopoto nikopoto.8@protonmail.com
pkgname=m8mouse-git
pkgver=2
pkgrel=1
pkgdesc="A RGB and DPI controller for m8mouse"
arch=('x86_64')
url="https://github.com/nikopoto/m8mouse"
license=("MIT")
depends=("hidapi")
makedepends=("git" "cmake" "pkgconf" "gcc" "make")
provides=("m8mouse")
conflicts=("m8mouse")
source=("git+https://github.com/nikopoto/m8mouse.git"
        "${pkgname}.install")
md5sums=("SKIP" "SKIP")
install="$pkgname.install"
options=(!debug)

build() {
  cd "$srcdir/m8mouse"
  cmake -S . -B build \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/m8mouse"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
