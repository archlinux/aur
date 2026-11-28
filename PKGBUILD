# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=pinch
pkgver=0.2.0
pkgrel=1
pkgdesc='Small, fast screenshot tool: select an area, annotate it, copy or save (X11 and Wayland)'
arch=('x86_64')
url='https://github.com/ufna/pinch'
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'wayland' 'kstatusnotifieritem' 'noto-fonts' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'glibc')
makedepends=('cmake' 'qt6-tools')
checkdepends=('dbus')
options=('!debug')
conflicts=('pinch-bin' 'pinch-git')
source=("$url/releases/download/v$pkgver/pinch-$pkgver.tar.gz")
sha256sums=('d17b3a502150639af5298fc24863ecbb8513792a7ec3e667480f654aa5778f98')

build() {
  cmake -S "$pkgname-$pkgver" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPINCH_WERROR=OFF
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
