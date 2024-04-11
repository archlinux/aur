# Maintainer: DawfukFR <dawfukfr@gmail.com>
# Contact: (Telegram: @Dawfuk)

pkgname=xwaylandvideobridge-git
_pkgname=xwaylandvideobridge
pkgver=r218.2c9168f
pkgrel=1
pkgdesc="A tool to make it easy to stream wayland windows and screens to Xwayland applicatons that don't have native pipewire support."
arch=(x86_64)
url='https://invent.kde.org/system/xwaylandvideobridge'
license=(GPL2)
provides=( xwaylandvideobridge )
depends=('ninja' 'qt6-base' 'qt6-declarative' 'kcoreaddons' 'kwidgetsaddons' 'kwindowsystem' 'knotifications' 'ki18n' 'libxcb' 'kpipewire' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'extra-cmake-modules')
makedepends=('git')
conflicts=( xwaylandvideobridge )
source=("${pkgname}::git+https://invent.kde.org/system/xwaylandvideobridge.git")
sha256sums=('SKIP')

# Dynamically update Package Version from Git
pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr .
  DESTDIR="${pkgdir}" ninja
}

check() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" ninja test
}

# Build Package
package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" ninja install
}
