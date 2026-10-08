# Maintainer: Anton Karasev <uselessfire at gmail dot com>

pkgname=plasma6-applets-application-title-bar-appmenu
_repo=application-title-bar-appmenu
pkgver=0.10.0.3
pkgrel=1
pkgdesc='Plasma 6 widget with the title, the buttons and the application menu of the active window'
arch=(x86_64)
url="https://github.com/uselessfire/$_repo"
license=('GPL-3.0-or-later AND GPL-2.0-or-later AND LGPL-2.0-or-later AND (GPL-2.0-only OR GPL-3.0-only)')
depends=(
  glibc
  kcmutils
  ki18n
  kirigami
  ksvg
  kwindowsystem
  libplasma
  libstdc++
  plasma-workspace
  plasma5support
  qt6-base
  qt6-declarative
)
makedepends=(
  cmake
  extra-cmake-modules
)
optdepends=(
  'appmenu-gtk-module-wayland: menus of GTK 3 applications on Wayland (AUR)'
  'appmenu-gtk-module: menus of GTK 3 applications on X11'
)
install=$pkgname.install
source=("$_repo-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Filled in by updpkgsums when the package is released; the copy in the project
# repository has SKIP.
sha256sums=('2e6debd693da89bb6ae2b3a27822ce47d6d236a381fb2a5c81b7b24765ffb576')

# The tests run in the CI of the project and before each release, not here: they
# depend on timing.
build() {
  cmake -B build -S "$_repo-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
