# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('aeroshell-kwin-components-x11-git')
pkgver=6.7.0_57.r24d3266
pkgrel=1
pkgdesc='X11 KWin effects for AeroShell-based desktops'
arch=(x86_64)
url="https://github.com/aeroshell-desktop/aeroshell-kwin-components"
license=('AGPL-3.0-or-later')
depends=(gcc-libs
         glibc
         kcmutils
         kdecoration
         ki18n
         qt6-base
         kcoreaddons
         kwindowsystem
         kconfig
         libepoxy
         kwin-x11
         aeroshell-kwin-components)
makedepends=(git
             extra-cmake-modules
             kdoctools
             plasma-wayland-protocols
             wayland-protocols)
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
conflicts=(aeroshell-kwin-components-x11)
provides=(aeroshell-kwin-components-x11)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(grep 'set(PROJECT_VERSION ' CMakeLists.txt | cut -d '"' -f 2)_$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%}"
  cmake -B build -DKWIN_BUILD_WAYLAND=OFF -DKWIN_INSTALL_MISC=OFF -DBUILD_TESTING=OFF .
  cmake --build build
}

package() {
  cd "$srcdir/${pkgname%}"
  DESTDIR="$pkgdir" cmake --install build
}
