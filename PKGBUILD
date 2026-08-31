# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>

pkgname=sonic-silver
_pkgname=silver
pkgver=6.7.4.6
pkgrel=1
pkgdesc='Highly customizable binary Window Decoration, Application Style and Global Theme plugin for SonicDE.'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-silver'
license=('LGPL-2.0-or-later')
depends=(frameworkintegration
         gcc-libs
         glibc
         hicolor-icon-theme
         kcmutils
         kcolorscheme
         kconfig
         ki18n
         kiconthemes
         kwidgetsaddons
         qt6-base
         qt6-declarative
         qt6-svg
         sonic-decoration
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-quick-ui
         sonic-frameworks-silver-icons
         sonic-frameworks-windowsystem
         xdg-utils)
makedepends=(sonic-frameworks-cmake-modules)
provides=(breeze sonic-silver-theme)
conflicts=(breeze sonic-silver-theme)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('14b49cb576e76c02913ef08fb81adbb25e0613a738e0e439d2c492c4c1d9982b')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT5=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
