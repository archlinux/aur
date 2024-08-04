# Maintainer: tarball <bootctl@gmail.com>

pkgname=ktailctl
pkgver=0.17.2
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
sha256sums=('49a99b800db270a5ed84eaf4e19c0b258998402e2730ef86452f66b62f2d7214')

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
