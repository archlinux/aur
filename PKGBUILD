# PKGBUILD for RSJFW
pkgname=rsjfw-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Roblox Studio Just Fucking Works - Hardened Linux compatibility layer in C++"
arch=('x86_64')
url="https://github.com/9nunya/RSJFW"
license=('MIT')
depends=('curl' 'libzip' 'wine')
makedepends=('cmake' 'gcc' 'make' 'pkg-config')
conflicts=('rsjfw')
provides=('rsjfw')
source=('rsjfw::git+https://github.com/9nunya/RSJFW.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rsjfw"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$srcdir/rsjfw" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
