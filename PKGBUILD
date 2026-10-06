# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-activities
pkgver=6.7.5
pkgrel=1
pkgdesc='Core components for SonicDE Activities'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-activities'
license=(LGPL-2.0-or-later)
depends=(glibc
         kconfig
         libstdc++
         qt6-base
         sonic-frameworks-core-addons)
makedepends=(qt6-declarative
             qt6-tools
             sonic-frameworks-cmake-modules)
optdepends=('qt6-declarative: QML bindings')
provides=(plasma-activities)
conflicts=(kactivities plasma-activities)
replaces=(kactivities)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f47a3dae0a385f84ab3723d1ff32450ec55c444856bb35ebcb70a5c885f36947')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
