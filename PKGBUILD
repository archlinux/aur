# PKGBUILD
# Maintainer: devlinman <dev.linman.tech@gmail.com>

pkgname=whatsit-git
pkgver=5.0.1
pkgrel=1
pkgdesc="Lightweight (KDE) native Qt6 WhatsApp Web client"
arch=('x86_64')
url="https://github.com/devlinman/whatsit"
license=('MIT')

depends=(
  'qt6-base'
  'qt6-webengine'

  'kconfig'
  'knotifications'
  'kstatusnotifieritem'
  'kwidgetsaddons'
  'kiconthemes'
)

makedepends=(
  'cmake'
  'git'
  'extra-cmake-modules'
  'ninja'
)

provides=("whatsit=$pkgver")
conflicts=('whatsit')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/whatsit"
  git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/whatsit"

  cmake -B build -S . \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build
}

package() {
  cd "$srcdir/whatsit"

  DESTDIR="$pkgdir" cmake --install build

}
