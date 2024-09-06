# Maintainer: DawfukFR <dawfukfr@gmail.com>
# Contact: (Telegram: @Dawfuk)

pkgname=xwaylandvideobridge-git
_pkgname=xwaylandvideobridge
pkgver=0.4.0_r243.g1a8d5af
pkgrel=1
pkgdesc="A tool to make it easy to stream wayland windows and screens to Xwayland applicatons that don't have native pipewire support."
arch=(x86_64)
url='https://invent.kde.org/system/xwaylandvideobridge'
license=(GPL2)
provides=(xwaylandvideobridge)
depends=(
  glibc
  gcc-libs
  qt6-base
  qt6-declarative
  kcrash
  kcoreaddons
  ki18n
  kwindowsystem
  kpipewire
  kstatusnotifieritem
  libxcb
)
makedepends=(
  extra-cmake-modules
  kdoctools
  knotifications
  git
)
conflicts=(xwaylandvideobridge)
source=("git+https://invent.kde.org/system/xwaylandvideobridge.git")
sha256sums=('SKIP')

# Dynamically update Package Version from Git
pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

# Build Package
package() {
  DESTDIR="$pkgdir" cmake --install build
}
