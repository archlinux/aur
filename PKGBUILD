# Maintainer: tarball <bootctl@gmail.com>

pkgname=ktailctl
pkgver=0.9.0
pkgrel=1
arch=(x86_64 aarch64)
url='https://github.com/f-koehler/KTailctl'
pkgdesc='GUI to monitor and manage Tailscale'
license=(GPL3)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  kconfig
  kcoreaddons
  kguiaddons5
  ki18n
  kirigami-addons
  kirigami2
  knotifications
  qt5-base
  qt5-declarative
  qt5-quickcontrols2
  qt5-svg
  tailscale
)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bee908a1cfcf15e108c3d5899e977d507fe2c922c0c32920177b1e65835e0463')

build() {
  cmake -B build -S KTailctl-$pkgver \
    -DDBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
