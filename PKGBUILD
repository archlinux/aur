# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-screen
pkgver=6.7.5.1
pkgrel=1
pkgdesc='SonicDE screen management software'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-screen'
license=(LGPL-2.0-or-later)
depends=(glibc
         kcmutils
         kconfig
         kcrash
         kdbusaddons
         ki18n
         kimageformats
         kitemmodels
         ksvg
         libstdc++
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
sha256sums=('2faa2c7be7773060b66322427c7d083b9bf36c3352ef1d363acd9ee85025afb0')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
