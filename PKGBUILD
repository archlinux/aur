# Maintainer: Masoud Yousefvand <yousefvand@gmail.com>

pkgname=remidock
pkgver=0.3.1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/yousefvand/RemiDock/archive/refs/tags/v0.3.1.tar.gz")
sha256sums=('2614608a2bf87201ccaeba5b3f5d91f494114b7abb3a6e80d26d01646ccef646')

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
