# Maintainer: lucinhu <lucinhu@qq.com>
pkgname=nano-j2me-git
pkgver=0.5.2.r0.gbea5022
pkgrel=1
pkgdesc="J2ME (CLDC 1.1 / MIDP 2.0) runtime and desktop emulator client (git master)"
arch=('x86_64' 'aarch64')
url="https://github.com/lucinhu/nano_j2me"
license=('MIT')
depends=('sdl2' 'curl' 'zlib')
makedepends=('cmake' 'ninja' 'git')
provides=("nano-j2me=$pkgver")
conflicts=('nano-j2me')
optdepends=('retroarch: run the bundled libretro core')
source=('git+https://github.com/lucinhu/nano_j2me.git')
sha256sums=('SKIP')

pkgver() {
  cd nano_j2me
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cmake -S nano_j2me -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DNJ_BUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 nano_j2me/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
