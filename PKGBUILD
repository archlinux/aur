# Maintainer: Jason Scurtu <code@xarbit.dev>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
#
# Development AUR package — builds the latest `main`. The recipe is
# static; the version is computed at build time by pkgver(). CI keeps it
# in sync with this file — edit this, not the AUR repo.
pkgname=plasma6-applets-appgrid-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A modern fullscreen application launcher for KDE Plasma (development build)"
arch=('x86_64')
url="https://appgrid.xarbit.dev"
license=('GPL-2.0-or-later')
provides=('plasma6-applets-appgrid')
conflicts=('plasma6-applets-appgrid')
depends=(
    'plasma-workspace'
    'kservice'
    'layer-shell-qt'
    'qt6-base'
    'kirigami'
    'kiconthemes'
    'ksvg'
    'glibc'
    'kio'
    'krunner'
    'kdeclarative'
    'qt6-declarative'
    'libstdc++'
    'libgcc'
    'kcoreaddons'
    'kwindowsystem'
    'kcmutils'
    'libplasma'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'git'
)
source=("plasma6-applet-appgrid::git+https://github.com/xarbit/plasma6-applet-appgrid.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "plasma6-applet-appgrid"
    local base
    base=$(grep -oP 'project\(AppGrid VERSION \K[0-9.]+' CMakeLists.txt)
    printf '%s.r%s.g%s' "$base" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "plasma6-applet-appgrid" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
