# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-browser-integration
pkgver=6.7.4
pkgrel=1
pkgdesc='Browser integration components for SonicDE'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-browser-integration'
license=(GPL-2.0-or-later)
depends=(glibc
         kconfig
         kcrash
         kdbusaddons
         kfilemetadata
         ki18n
         kjobwidgets
         kservice
         kstatusnotifieritem
         libstdc++
         purpose
         qt6-base
         sonic-activities
         sonic-frameworks-core-addons
         sonic-frameworks-io
         sonic-workspace)
makedepends=(sonic-frameworks-cmake-modules)
provides=(plasma-browser-integration)
conflicts=(plasma-browser-integration)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('12b205ee634f96ebbbe44cccce04fcdfe325ae28c34546db2de0d2e77b512ce7')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DINSTALL_CHROME_MANIFEST=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
