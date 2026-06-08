# Maintainer: Tymour Kadry <tymitaly@gmail.com>
pkgname=dictapulse
pkgver=0.1.1
pkgrel=1
pkgdesc="Local AI voice dictation for KDE Plasma (Wayland)"
arch=('x86_64')
url="https://github.com/Silverhairfx/DictaPulse"
license=('GPL-3.0-or-later')
depends=(
  qt6-base qt6-declarative qt6-multimedia qt6-svg qt6-wayland
  kglobalaccel kstatusnotifieritem knotifications kconfig
  kcolorscheme kwindowsystem qtkeychain-qt6
  hicolor-icon-theme
)
optdepends=(
  'ydotool: text injection via uinput (needs the ydotoold daemon running)'
  'wtype: text injection on wlroots/Wayland'
)
makedepends=(cmake extra-cmake-modules git
             vulkan-headers vulkan-icd-loader shaderc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c2745aaf50b330a231c53a2d03da44f5aea44da96818c6e8403be296e68658a3')

build() {
  cd "DictaPulse-$pkgver"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDICTAPULSE_ENABLE_VULKAN=ON
  cmake --build build -j"$(nproc)"
}

package() {
  cd "DictaPulse-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
