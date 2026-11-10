# Maintainer: lucinhu <lucinhu@qq.com>
pkgname=nano-j2me
pkgver=0.5.6
pkgrel=1
pkgdesc="J2ME (CLDC 1.1 / MIDP 2.0) runtime and desktop emulator client"
arch=('x86_64' 'aarch64')
url="https://github.com/lucinhu/nano_j2me"
license=('MIT')
depends=('sdl2' 'curl' 'zlib')
makedepends=('cmake' 'ninja')
optdepends=('retroarch: run the bundled libretro core')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e48e5b5fb13dd5da62298a9b82b5c3b8c3d1278a1c748e1aca4749d5bbfdf6b')

build() {
  cmake -S "nano_j2me-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DNJ_BUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "nano_j2me-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
