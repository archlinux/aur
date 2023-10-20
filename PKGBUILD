# Maintainer: tarball <bootctl@gmail.com>

pkgname=ktailctl
pkgver=0.10.0
pkgrel=2
arch=(x86_64 aarch64)
url='https://github.com/f-koehler/KTailctl'
pkgdesc='GUI to monitor and manage Tailscale'
license=(GPL3)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  kconfig5
  kcoreaddons5
  kguiaddons5
  ki18n5
  kirigami-addons
  kirigami2
  knotifications5
  qt5-base
  qt5-declarative
  qt5-quickcontrols2
  qt5-svg
  tailscale
)
makedepends=(cmake extra-cmake-modules)

# git tag is used by the cmake script to determine app version
source=(git+$url.git#tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cmake -B build -S KTailctl \
    -DDBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
