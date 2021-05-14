# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=nx-kwin-decoration-git
pkgver=r86.2ad4ec3
pkgrel=1
pkgdesc="KWin decoration for NX Desktop, by Nitrux SA."
arch=(x86_64)
url="https://github.com/nx-desktop/nx-window-deco"
license=(GPL3)
depends=('kcoreaddons' 'kguiaddons' 'kconfigwidgets' 'kwindowsystem'
         'ki18n' 'kiconthemes' 'qt5-x11extras')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools')
provides=('nx-kwin-decoration' 'nomad-kwin-decoration' 'nx-window-deco')
conflicts=('nx-kwin-decoration' 'nomad-kwin-decoration' 'nx-window-deco')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd nx-window-deco
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S nx-window-deco
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}