# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('aeroshell-kwin-components-git')
pkgver=6.7.0_57.r24d3266
pkgrel=1
pkgdesc='KWin effects, scripts, and other plugins for AeroShell-based desktops'
arch=(x86_64)
url="https://github.com/aeroshell-desktop/aeroshell-kwin-components"
license=('AGPL-3.0-or-later')
depends=(gcc-libs
         glibc
         kwin
         libepoxy
         kconfig
         kcmutils
         kdecoration
         ki18n
         kcoreaddons
         kwindowsystem
         qt6-base
         qt6-svg
         kirigami
         plasma-workspace
         plasma5support
         qt6-declarative
         aeroshell-libplasma
         ksvg
         qt6-5compat
         wayland)
makedepends=(git
             extra-cmake-modules
             kdoctools
             plasma-wayland-protocols
             wayland-protocols
             vulkan-headers)
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
conflicts=(aeroshell-kwin-components)
provides=(aeroshell-kwin-components)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(grep 'set(PROJECT_VERSION ' CMakeLists.txt | cut -d '"' -f 2)_$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -DKWIN_BUILD_WAYLAND=ON -DBUILD_TESTING=OFF -S ${pkgname%}
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
