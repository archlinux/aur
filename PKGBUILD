# Maintainer: devlinman <dev.linman.tech@gmail.com>

pkgname=whatsit-git
pkgver=3.0.1.r1.g0c8842a
pkgrel=2
pkgdesc="Lightweight (KDE) native Qt6 WhatsApp Web client"
arch=('x86_64')
url="https://github.com/devlinman/whatsit"
license=('MIT')

depends=(
  'qt6-base'
  'qt6-webengine'
  'extra-cmake-modules'
  'kwidgetsaddons'
  'kstatusnotifieritem'
  'kiconthemes'
)

makedepends=('cmake' 'git' 'vulkan-headers')

provides=('whatsit')
conflicts=('whatsit')

source=("git+https://github.com/devlinman/whatsit.git")
sha256sums=('SKIP')

pkgver() {
  cd whatsit
  git describe --long --tags --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd whatsit
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd whatsit
  DESTDIR="$pkgdir" cmake --install build
}
