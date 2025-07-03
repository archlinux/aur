# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=lightlyshaders-git
pkgver=3.0.0.r2.g64bd1a9
pkgrel=1
pkgdesc="Round corners and outline effect for KWin"
arch=(x86_64)
url="https://github.com/a-parhom/LightlyShaders"
license=('GPL-2.0-or-later')
depends=('kconfig' 'kconfigwidgets' 'kcoreaddons' 'kcrash' 'kglobalaccel' 'kguiaddons' 'kcmutils'
         'ki18n' 'kio' 'kservice' 'knotifications' 'kwidgetsaddons' 'kwindowsystem')
makedepends=('git' 'extra-cmake-modules')
provides=('lightlyshaders')
conflicts=('lightlyshaders')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd LightlyShaders
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLIB_INSTALL_DIR=lib -B build -S LightlyShaders
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
