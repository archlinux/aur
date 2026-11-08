# Maintainer: cenky <cenkkgl@gmail.com>

pkgname=akyuu
pkgver=0.2.1
pkgrel=1
pkgdesc='Anime list tracker with player and browser detection'
arch=('x86_64')
url='https://github.com/ligneo/akyuu'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'systemd-libs' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'gcc' 'qt6-tools')
source=('https://github.com/ligneo/akyuu/releases/download/v0.2.1/akyuu-0.2.1-source.tar.xz')
sha256sums=('03a64637549b6e8b70541547e71774c5c7a32e37da042d09e327a8d2d39efbe6')
build() {
  cmake -S "akyuu-0.2.1" -B build -G Ninja -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY="$srcdir/build/bin" -DCMAKE_INSTALL_PREFIX=/usr \
    -DAKYUU_PORTABLE=OFF -DAKYUU_PACKAGE_FORMAT=arch -DAKYUU_BUILD_TESTS=ON
  cmake --build build --parallel "${BUILD_JOBS:-2}"
}
check() { ctest --test-dir build --output-on-failure; }
package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "akyuu-0.2.1/LICENSE" "$pkgdir/usr/share/licenses/akyuu/LICENSE"
}
