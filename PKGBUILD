# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-terminal-tools
pkgver=6.7.5
pkgrel=1
pkgdesc='Tools based on SonicDE Frameworks to better interact with the system'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-terminal-tools'
license=(LGPL-2.0-or-later)
depends=(glibc
         kcmutils
         kcompletion
         kconfig
         kdesu
         ki18n
         kparts
         kservice
         kwidgetsaddons
         libstdc++
         qt6-base
         qt6-svg
         sh
         sonic-frameworks-core-addons
         sonic-frameworks-icon-themes
         sonic-frameworks-io
         sonic-frameworks-windowsystem)
makedepends=(sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
optdepends=('sonic-system-info: view hardware information')
provides=(kde-cli-tools)
conflicts=(kde-cli-tools)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('05115bf0a4791ee110daa2a7ae458aaa30b8a2047a7e49ae41dc7de0793a95d9')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
