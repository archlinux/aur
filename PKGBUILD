pkgname=m8mouse-git
pkgver=1.0.r3.g3b5d0d4
pkgrel=1
pkgdesc="A RGB and DPI controller for m8mouse"
arch=('x86_64')
url="https://github.com/nikopoto/m8mouse"
license=('MIT')
depends=('hidapi')
makedepends=('git' 'cmake' 'pkgconf' 'gcc' 'make')
provides=('m8mouse')
conflicts=('m8mouse')
source=("git+https://github.com/nikopoto/m8mouse.git")
md5sums=('SKIP')
install="$pkgname.install"

pkgver() {
  cd "$srcdir/m8mouse"
  echo "1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

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
  install -Dm644 90-m8mouse.rules "$pkgdir/etc/udev/rules.d/90-m8mouse.rules"
}
