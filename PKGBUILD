pkgname=akyuu
pkgver=0.5.0
pkgrel=1
pkgdesc='Anime list tracker with player and browser detection'
arch=('x86_64')
url='https://github.com/ligneo/akyuu'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'gcc' 'qt6-tools')
source=('https://github.com/ligneo/akyuu/releases/download/v0.5.0/akyuu-0.5.0-source.tar.xz')
sha256sums=('336518816e22f2badf793930a2b0fc1b172652cff639c0c1ce6ec521eb15c034')
build() {
  cmake -S "akyuu-0.5.0" -B build -G Ninja -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY="$srcdir/build/bin" -DCMAKE_INSTALL_PREFIX=/usr \
    -DAKYUU_PORTABLE=OFF -DAKYUU_PACKAGE_FORMAT=arch -DAKYUU_BUILD_TESTS=ON
  cmake --build build --parallel "${BUILD_JOBS:-2}"
}
check() { ctest --test-dir build --output-on-failure; }
package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "akyuu-0.5.0/LICENSE" "$pkgdir/usr/share/licenses/akyuu/LICENSE"
}
