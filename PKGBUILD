# Maintainer: tarball <bootctl@gmail.com>

pkgname=ktailctl
pkgver=0.17.0
pkgrel=1
arch=(x86_64 aarch64)
url='https://github.com/f-koehler/KTailctl'
pkgdesc='GUI to monitor and manage Tailscale'
license=(GPL-3.0-only)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  kconfig
  kcoreaddons
  kguiaddons
  ki18n
  kirigami
  kirigami-addons
  knotifications
  qqc2-desktop-style
  qt6-base
  qt6-declarative
  qt6-svg
  tailscale
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  go
  nlohmann-json
)

# git tag is used by the cmake script to determine app version
source=(git+$url.git#tag=v$pkgver)
sha256sums=('98bb69ae5652c8fa02e6e7c428070cb6e78c6ecc971d2a0cc35f379c92d07c2a')

prepare() {
  cd KTailctl/src/wrapper
  go mod vendor
}

build() {
  cmake -B build -S KTailctl \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
