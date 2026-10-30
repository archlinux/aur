# Maintainer: lucinhu <lucinhu@qq.com>
pkgname=nano-j2me
pkgver=0.5.2
pkgrel=1
pkgdesc="J2ME (CLDC 1.1 / MIDP 2.0) runtime and desktop emulator client"
arch=('x86_64' 'aarch64')
url="https://github.com/lucinhu/nano_j2me"
license=('MIT')
depends=('sdl2' 'curl' 'zlib')
makedepends=('cmake' 'ninja')
optdepends=('retroarch: run the bundled libretro core')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df18cf16d2e655a62db659c1bbda166fdbcd3c7c3eef8744f8863b2261ce5689')

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
