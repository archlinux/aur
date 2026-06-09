# Maintainer: Masoud Yousefvand <yousefvand@gmail.com>

pkgname=remidock
pkgver=0.2.0
pkgrel=2
pkgdesc='Custom Qt/QML dock for KDE Plasma Wayland'
arch=('x86_64')
url='https://github.com/yousefvand/RemiDock'
license=('MIT')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-imageformats'
  'layer-shell-qt'
  'libpulse'
)
makedepends=(
  'cmake'
  'ninja'
  'gcc'
  'extra-cmake-modules'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/yousefvand/RemiDock/archive/refs/tags/v0.2.0.tar.gz")
sha256sums=('ec030a915a1f25d0bb76bba6fac3d48e453d4c4894f37333c10d58d5a2e1702f')

build() {
  cmake -S "RemiDock-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "RemiDock-${pkgver}/icon.png" "$pkgdir/usr/share/pixmaps/remidock.png"

  if [[ -f "$pkgdir/usr/share/applications/org.remisa.RemiDock.desktop" ]]; then
    sed -i 's/^Icon=.*/Icon=remidock/' "$pkgdir/usr/share/applications/org.remisa.RemiDock.desktop"
  fi
}
