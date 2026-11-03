# Maintainer: Allan Chain <allan-chainatoutlookdotcom>
pkgname=sane-break
pkgver=0.10.7
pkgrel=2
pkgdesc="A gentle break reminder that helps you avoid mindlessly skipping breaks."
arch=('x86_64')
url="https://github.com/AllanChain/sane-break"
license=('GPL-3.0-or-later')
depends=(
  "qt6-base"
  "qt6-multimedia"
  "hicolor-icon-theme" # needed for hicolor theme hierarchy
  "libx11"
  "libxss"
  "wayland"
  "layer-shell-qt"
  "cli11"
)
makedepends=(
  "cmake"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8cfe642dd63eeedabaf93b13b4bdd94162b97a39cfc2f20ec52b3eddc7626f2a')

build() {
  cd "$pkgname-$pkgver"

  # Upstream uses NDEBUG to select release paths (db/socket/lock filenames),
  # not just assert(). Build type None keeps makepkg's -O2, so define it here.
  export CXXFLAGS+=" -DNDEBUG"
  cmake -DCMAKE_BUILD_TYPE=None .
  cmake --build . --parallel
}

package() {
  cd "$pkgname-$pkgver"

  cmake --install . --prefix "$pkgdir/usr"
}
