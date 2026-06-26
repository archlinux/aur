# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-screen
pkgver=6.7.1
pkgrel=1
pkgdesc='SonicDE screen management software'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-screen'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kcmutils
         kconfig
         kcrash
         kdbusaddons
         ki18n
         kimageformats
         kitemmodels
         ksvg
         libx11
         libxcb
         libxi
         plasma5support
         qt6-base
         qt6-declarative
         sonic-frameworks-core-addons
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-screen-library)
makedepends=(sonic-frameworks-cmake-modules)
provides=(kscreen)
conflicts=(kscreen)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7ebe978301771b4f9c76a8fd1bdc49a483f9bf733a5003e554bc076cda726615')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
