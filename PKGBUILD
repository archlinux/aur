# Maintainer: devlinman <dev.linman.tech@gmail.com>

pkgname=whatsit-git
pkgver=2.0.0.r1.g34a7dba
pkgrel=1
pkgdesc="Lightweight native Qt6 WhatsApp Web client"
arch=('x86_64')
url="https://github.com/devlinman/whatsit"
license=('MIT')

depends=(
  'qt6-base'
  'qt6-webengine'
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
